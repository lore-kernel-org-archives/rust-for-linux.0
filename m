Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A78E26656D;
	Mon, 21 Sep 2026 04:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789964065; cv=none; b=F03nVb6FB83blOZsegCBPBg0+iEYWlJzIObLQCTGSTq9t2GCjpilCHrk8KPapxjRXUx8wAEXbuxD6lK+bxUG9Yi2UVmMSSmsh8FhpLDM5+LbO/eWsgkfDeLQ9H0b2uVGyuiVOnSlN0PbCw8fK9xPnKNxkIUhsixjbup4ZZxM5Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789964065; c=relaxed/simple;
	bh=iRYvNnPl3VQmlECSCn53GfxBtZNkyCBLb8oOBJnXe2s=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=V0plzjIV5363UREqrJxqVTa6wlZxiQJ5YXvG3m1zSZvJTJmLju1rSQLz5IDrwyEmxOaO/up+xeKpCxDKi8gT0+aZ3mCtQnkyokB6FAD/b9/Z6LuKpAcn4e7eKMVuGEM4TZ3FwBmsqUrPTMlIMgb0rMJGlLUaIgn8MyY+AGVAZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=znMxX8Bx; arc=none smtp.client-ip=43.163.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="znMxX8Bx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789964053; bh=O3RVgr7CiMucacgWG0CW24IkajveUZ/7Nmd8pYeqxDs=;
	h=From:To:Cc:Subject:Date;
	b=znMxX8BxAarSgoRmBtEC+0mHqWRxWN0rbZlKqI6NB5rqgumlt8+xj0LajjvkFYmmR
	 ektHBOu3TlhLYuiWqu1O3ZqQWZH7jTXc2JNs3ijiK34PwLNndjeNnVtIpSmwGsvppM
	 Js6tYDSWGyeSHj6afFn1KDAFfw+DZfa3btCf7lZg=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 389942B0; Mon, 21 Sep 2026 12:14:09 +0800
X-QQ-mid: xmsmtpt1789964049t1mv0ye6k
Message-ID: <tencent_F3A825AD475CB58F5C0D1C833FD3353E130A@qq.com>
X-QQ-XMAILINFO: NEW4AM7T0EBsYG2ExRARQxO3hr6TdO07J16dKb0jPZqRt1GtGL3OFK+pv+W8aA
	 L2sLTn5ti49z5EpicYGh025QxxwYCn5JXR0d2Z71tv3U0X+HSaENSVrpo81I6QZtvUTkTMhiv0aD
	 nI+PVgCAyNdMsdWLfrUgpe3M2TIuqU7zbNNERNVRzFHyk7OQY3RSCrU45J6mfN5Mpvyu39id+tlV
	 wKQF4n15MAqfiCW1HAoQ0cSnljsdazJC/eU/suqFG7YUCUyRxJjZ0VKXXcusI8GjuLjigbDw0fJu
	 fd/ntNL/sjEhiy/YSw7qfz3mi9CxfpqrJ8+6BYdFqn7vVv3YyJxmDcKVD220GNFm8F0JjpO5H4mE
	 vrsTEOArnBgiIJJ2PeWy9tGe+n5tJCclWP84D86sdLPVIUZWbo78NVcDi7z7i/walvVbPB1ai1oj
	 1kAzSfOzHjEA/ssq1pEhysrCJfX1SvH/ElOFO+uGmRgHxZV9lgmKvpdPxD9nhLlrYTJgpTXEwXvI
	 UzlqOO2Ot4Wv1OmFyFqY7PZXijthnuRFVxe1xyWj600ZjKWRPOuI7/2bsSJYIUr7I1gnixQBfH7x
	 ea0P8tnQrlhuIBPS/BhFI8tbIcLWHWnWPh1gevsndGIOFbqBCp03fN3S/eWcPs7dOBdpBjNOmb9d
	 h3WqBazLb+fYJCKfjE/WggQxDlZRV8CBEl7HFbn0aD0o3tgdpwO5XPFbtmIkIX6yN3tOiGx43u3j
	 3GV4fP3MaUdVYWmCtLE1TR670M7tJr04eSSOZjR20u3WhtPmI1qE0AfWub/VfadwzWy8kdPFr2oP
	 IMPmT2hmLF5n9vj+r5gxBPNSpBOyCt0gdJ1x0E9N5XB7hj7fYA6o/ozzToJDGlTqj6VH3Pb7UwP9
	 td1slwKmV6sriE+3/iBEMj2TBmKLqPg67d1bNHNPKvCrdj2VZ+Ie4+Rj9e3aNjRINqO6jfloEhcA
	 JPOEBsivnoFZITjnY2iwCGPx62srRB657TI5ZoJcQzoZeOMKeGR3TK7Qry8TWZ4m+dOdYVtTI802
	 v1rZj1riTRGzZkQ/SEIjCOOJLGsE5cbHfWaA6keEA6PInpx2I3L9rBSU5kiaqrjfSxSPrKZpy5Gz
	 4bcQc3mET1eF2cMCI=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yilin Chen <1479826151@qq.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: list: document safety discharge and add offset_of! check
Date: Mon, 21 Sep 2026 04:14:07 +0000
X-OQ-MSGID: <20260921041407.1203693-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining "// Safety: TODO" in the Rust intrusive list
implementation with explanations.

Also, the `impl_has_list_links_self_ptr!` macro does not perform
the field-path validation already used by `impl_has_list_links!`.
As a result, `addr_of_mut!` also accepts paths that require
implicit dereferencing.

Use offset_of! in an unreachable branch to ensure that the path consists
only of actual nested fields. The value is not evaluated, so the check
has no runtime cost.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Should.20.60impl_has_list_links_self_ptr.21.60.20add.20offset_of.21.20macro.3F/with/624615061

Signed-off-by: Yilin Chen <1479826151@qq.com>
---

I don't know whether it is designed for allowing that format. But I think
it is better to restrict the field path to embedded in Self, so I added
offset_of! check to ensure that.

I opened a topic in Zulip to discuss this but nobody has responded yet.
The link is in the commit message.

Looking for feedback from the maintainers about whether this is
a good idea. Thank you for your feedback.

 rust/kernel/list.rs                    | 10 ++++++-
 rust/kernel/list/impl_list_item_mod.rs | 36 ++++++++++++++++++++------
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 0f367264ee2e..28e109750968 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -599,7 +599,15 @@ pub fn pop_front(&mut self) -> Option<ListArc<T, ID>> {
     ///
     /// `item` must not be in a different linked list (with the same id).
     pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
-        // SAFETY: TODO.
+        // SAFETY:
+        // - `item` is a valid reference to a value of type `T`, satisfying the requirement of
+        //   `ListItem::view_links`.
+        // - If the item is not in a list, `ListItem::view_links` guarantees that the
+        //   returned pointer points at a read-only `ListLinks` with two null pointers,
+        //   which is dereferenceable.
+        // - If the item is in a list, `ListItem::view_links` guarantees that the
+        //   returned pointer is the same as the most recent `ListItem::prepare_to_insert`,
+        //   which is dereferenceable.
         let mut item = unsafe { ListLinks::fields(T::view_links(item)) };
         // SAFETY: The user provided a reference, and reference are never dangling.
         //
diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
index 5a3eac9f3cf0..87ce54d9215b 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -82,16 +82,26 @@ pub unsafe trait HasSelfPtr<T: ?Sized, const ID: u64 = 0>
        for $self:ty
        { self$(.$field:ident)* }
     )*) => {$(
-        // SAFETY: The implementation of `raw_get_list_links` only compiles if the field has the
-        // right type.
+        // SAFETY: The implementation of `raw_get_list_links` returns the `inner` field of the
+        // `ListLinksSelfPtr<$item_type, ID>` selected by the field path.
         unsafe impl$(<$($generics)*>)? $crate::list::HasSelfPtr<$item_type $(, $id)?> for $self {}
 
-        // SAFETY: TODO.
+        // SAFETY: The implementation of `raw_get_list_links` only compiles if the field has type
+        // `ListLinksSelfPtr<$item_type, ID>`. Since `ListLinksSelfPtr` is `repr(C)` and `inner` is
+        // its first field, a pointer to the former is also a pointer to the latter.
         unsafe impl$(<$($generics)*>)? $crate::list::HasListLinks$(<$id>)? for $self {
             #[inline]
             unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$id>)? {
+                // Statically ensure that `$(.field)*` doesn't follow any pointers.
+                //
+                // Cannot be `const` because `$self` may contain generics and E0401 says constants
+                // "can't use {`Self`,generic parameters} from outer item".
+                if false { let _: usize = ::core::mem::offset_of!(Self, $($field).*); }
+
                 let ptr: *mut $crate::list::ListLinksSelfPtr<$item_type $(, $id)?> =
-                    // SAFETY: The caller promises that the pointer is not dangling.
+                    // SAFETY: The caller promises that the pointer points at a valid `Self`. We
+                    // know that this expression doesn't follow any pointers, as the `offset_of!`
+                    // invocation above would otherwise not compile.
                     unsafe { ::core::ptr::addr_of_mut!((*ptr)$(.$field)*) };
                 ptr.cast()
             }
@@ -274,14 +284,18 @@ unsafe fn prepare_to_insert(me: *const Self) -> *mut $crate::list::ListLinks<$nu
                 // SAFETY: The caller promises that `me` points at a valid value of type `Self`.
                 let links_field = unsafe { <Self as $crate::list::ListItem<$num>>::view_links(me) };
 
-                // SAFETY: TODO.
+                // SAFETY: `links_field` was returned by `view_links`, which forwards the pointer
+                // returned by `HasListLinks::raw_get_list_links`. `HasSelfPtr` guarantees that
+                // this `ListLinks` is the `inner` field of a `ListLinksSelfPtr<Self, $num>`.
+                // Therefore, the resulting container pointer is in bounds of the same allocation.
                 let container = unsafe {
                     $crate::container_of!(
                         links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
                     )
                 };
 
-                // SAFETY: By the same reasoning above, `links_field` is a valid pointer.
+                // SAFETY: By the reasoning above, `container` points at a valid
+                // `ListLinksSelfPtr<Self, $num>`.
                 let self_ptr = unsafe {
                     $crate::list::ListLinksSelfPtr::raw_get_self_ptr(container)
                 };
@@ -326,14 +340,20 @@ unsafe fn view_links(me: *const Self) -> *mut $crate::list::ListLinks<$num> {
             //   `ListArc` containing `Self` until the next call to `post_remove`. The value cannot
             //   be destroyed while a `ListArc` reference exists.
             unsafe fn view_value(links_field: *mut $crate::list::ListLinks<$num>) -> *const Self {
-                // SAFETY: TODO.
+                // SAFETY: The caller guarantees that `links_field` either originated from the
+                // most recent `prepare_to_insert` or was returned by a subsequent `view_links`,
+                // and that `post_remove` has not been called since. In either case, the pointer
+                // originated from `HasListLinks::raw_get_list_links`, and `HasSelfPtr` guarantees
+                // that this `ListLinks` is the `inner` field of a `ListLinksSelfPtr<Self, $num>`.
+                // Therefore, the resulting container pointer is in bounds of the same allocation.
                 let container = unsafe {
                     $crate::container_of!(
                         links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
                     )
                 };
 
-                // SAFETY: By the same reasoning above, `links_field` is a valid pointer.
+                // SAFETY: By the reasoning above, `container` points at a valid
+                // `ListLinksSelfPtr<Self, $num>`.
                 let self_ptr = unsafe {
                     $crate::list::ListLinksSelfPtr::raw_get_self_ptr(container)
                 };
-- 
2.25.1

