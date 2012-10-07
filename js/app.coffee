# シーンを作成
scene = new THREE.Scene()

# 3D文字を作成
textGeo = new THREE.TextGeometry('Hello World!', {
  size: 70,
  height: 20,
  curveSegments: 4,
  font: "optimer",
  weight: "bold",
  style: "normal",
  material: 0,
  extrudeMaterial: 1
})

# 文字の質感を設定
textMaterialFront = new THREE.MeshBasicMaterial({
  color: 0x66ff66,
  opacity: 1,
})
textMaterialSide = new THREE.MeshBasicMaterial({
  color: 0x00aa00,
})
textGeo.materials = [textMaterialFront, textMaterialSide]

# メッシュオブジェクトを作成
mesh = new THREE.Mesh(textGeo, new THREE.MeshFaceMaterial())
mesh.position = {x: 0, y: 0, z: 0}
mesh.rotation.x = 0
mesh.rotation.y = Math.PI * 2
scene.add(mesh)

# カメラを配置
camera = new THREE.PerspectiveCamera(40, document.width / document.height, 1, 10000)
camera.position.y = 300
camera.position.z = 1000

# レンダラーを作成
renderer = new THREE.WebGLRenderer({antialias: true})
renderer.setSize(document.width, document.height)
document.body.appendChild(renderer.domElement)

# ライトを作成
light = new THREE.DirectionalLight(0xFFFFFF)
light.position = {x:100, y:1000, z:1000}
scene.add(light)

# ドラッグでカメラが動くように
control = new THREE.TrackballControls(camera, renderer.domElement)

# 100msごとに再描画
setInterval ->
  control.update()
  renderer.render(scene, camera)
, 100
