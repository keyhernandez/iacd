package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(PrecioController)
@Mock(Precio)
class PrecioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/precio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.precioInstanceList.size() == 0
        assert model.precioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.precioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.precioInstance != null
        assert view == '/precio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/precio/show/1'
        assert controller.flash.message != null
        assert Precio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/precio/list'

        populateValidParams(params)
        def precio = new Precio(params)

        assert precio.save() != null

        params.id = precio.id

        def model = controller.show()

        assert model.precioInstance == precio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/precio/list'

        populateValidParams(params)
        def precio = new Precio(params)

        assert precio.save() != null

        params.id = precio.id

        def model = controller.edit()

        assert model.precioInstance == precio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/precio/list'

        response.reset()

        populateValidParams(params)
        def precio = new Precio(params)

        assert precio.save() != null

        // test invalid parameters in update
        params.id = precio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/precio/edit"
        assert model.precioInstance != null

        precio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/precio/show/$precio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        precio.clearErrors()

        populateValidParams(params)
        params.id = precio.id
        params.version = -1
        controller.update()

        assert view == "/precio/edit"
        assert model.precioInstance != null
        assert model.precioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/precio/list'

        response.reset()

        populateValidParams(params)
        def precio = new Precio(params)

        assert precio.save() != null
        assert Precio.count() == 1

        params.id = precio.id

        controller.delete()

        assert Precio.count() == 0
        assert Precio.get(precio.id) == null
        assert response.redirectedUrl == '/precio/list'
    }
}
