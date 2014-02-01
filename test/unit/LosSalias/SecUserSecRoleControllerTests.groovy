package LosSalias



import org.junit.*
import grails.test.mixin.*

@TestFor(SecUserSecRoleController)
@Mock(SecUserSecRole)
class SecUserSecRoleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/secUserSecRole/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.secUserSecRoleInstanceList.size() == 0
        assert model.secUserSecRoleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.secUserSecRoleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.secUserSecRoleInstance != null
        assert view == '/secUserSecRole/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/secUserSecRole/show/1'
        assert controller.flash.message != null
        assert SecUserSecRole.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/secUserSecRole/list'

        populateValidParams(params)
        def secUserSecRole = new SecUserSecRole(params)

        assert secUserSecRole.save() != null

        params.id = secUserSecRole.id

        def model = controller.show()

        assert model.secUserSecRoleInstance == secUserSecRole
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/secUserSecRole/list'

        populateValidParams(params)
        def secUserSecRole = new SecUserSecRole(params)

        assert secUserSecRole.save() != null

        params.id = secUserSecRole.id

        def model = controller.edit()

        assert model.secUserSecRoleInstance == secUserSecRole
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/secUserSecRole/list'

        response.reset()

        populateValidParams(params)
        def secUserSecRole = new SecUserSecRole(params)

        assert secUserSecRole.save() != null

        // test invalid parameters in update
        params.id = secUserSecRole.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/secUserSecRole/edit"
        assert model.secUserSecRoleInstance != null

        secUserSecRole.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/secUserSecRole/show/$secUserSecRole.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        secUserSecRole.clearErrors()

        populateValidParams(params)
        params.id = secUserSecRole.id
        params.version = -1
        controller.update()

        assert view == "/secUserSecRole/edit"
        assert model.secUserSecRoleInstance != null
        assert model.secUserSecRoleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/secUserSecRole/list'

        response.reset()

        populateValidParams(params)
        def secUserSecRole = new SecUserSecRole(params)

        assert secUserSecRole.save() != null
        assert SecUserSecRole.count() == 1

        params.id = secUserSecRole.id

        controller.delete()

        assert SecUserSecRole.count() == 0
        assert SecUserSecRole.get(secUserSecRole.id) == null
        assert response.redirectedUrl == '/secUserSecRole/list'
    }
}
