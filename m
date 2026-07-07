Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB9372EFF;
	Tue,  7 Jul 2026 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440148; cv=none; b=BzeG98AbtK69v37H4vgdMajO4bRvQA90Er2myjb/ghPL3EpuYMvXi+j5bG4hps5oYBnq0pLtf03KFnDEi6V0OeSvnsgkisia43FA0z0nqngNf0M/Oh4AdntZ1qS4to8RGoIT0e6OZFTBIm9i8Xbm2Se/5Jq/+omQzr3SBBNXT8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440148; c=relaxed/simple;
	bh=MpRywiznrlNmQIZtLUedtUx9KEmUuJsYKg2DVHqrMpY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=IBOwTIEa/WeSnAOtqH56qFlGXgx5uZLlM3v5ME9KKWzaZykpbXua0/Aq1AARGYYDF2nkhnZMnAaGcR5/6dNQXwc9F+Heh+QCFM1rA7IY3tTfTdbG+ryfBJN70HXnusWzKlUvSOAsk+P+EHp/wjbXFo/iJMbCi/uZ9oSUlUZxRAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=qgEDcubZ; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="qgEDcubZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783440142; bh=ZJlYGquIV8wKaCWsETdoz4HoiPJMF0YxXf1C73RyCJQ=;
	h=From:To:Cc:Subject:Date;
	b=qgEDcubZrNM1kxyIjJd01z2qcvPfzxMNK4zHIJbtl9TbTODQ6g6RPy1yOJKCWxveL
	 a5PJhg3/HbxwU/OffvyWkkvihb0MaeKVacdsqB/54bVVN88KWfH6MR43/HYwKm13e0
	 PZswe2EtOOh4T2bwdmPryY2nNQ8skIfzfxpEPjH4=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8B8960D; Wed, 08 Jul 2026 00:02:11 +0800
X-QQ-mid: xmsmtpt1783440131tivx7ad3b
Message-ID: <tencent_37A376A02B95E3DBE7E5C64882B7A4F90807@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku28jb5ZATyyL3reZyKwZFufFApNxo8yktzmLSkEpNs1l86pE426y
	 ovYm168aLmqPnhNU6TyYMj7XAkx0ey0RU+/eVborQLtNJBDHEt8VBh4IcNS0nxW/ZND9+sA58oat
	 jT9Xbtw0TnCDKLIlKhGroldgX+QAiET0SfbpyeKAgKlsZ+b/K9i6tufPbvxqBJb9oUoH3O82pFLR
	 2ou4/XvC7TzthMC5PTzOCj49YpEWVY476FJwPGbGaZqt34CHI/XUZJEDwhadWKDz5ztL7K1VgzMB
	 +8sDSFGK2EBhYixtwMR6T7d5by4o8EyTtlO3Pi/LTFxHPY8FN/zTfqmLnAGT5jigvTjIKWrr4pPn
	 B0rqJC02kAKwoigPRaGuqXBHykzkgYXrMUIIdctbWYd/jc2943Wo1DlOeeTE6hR79aR1rbxAyp6S
	 GqRCMDABUvTj+nBT7T0u/E9LLn1yU1TzjMHfq6hLIR13dKnRoMpojv9jt9cO1webbxut397BzcrS
	 7mj4q81JL/3Bmz6/Ilm+HNJEjJH/H+48cd+iGG2NiLcj2OfOXvgM00eXgsOr57kDSIi48NxpCF1e
	 GYs8qezpiHYJGA5UYG5CnUG8htOJfvaG/8PeFuqpsPys5fTrZLMknIYf8+PrhLhgPlGr6SqX//Yb
	 I3/vH3G5VBzawUnj584pkYyKHmL0IXrm/CdEttqibyPAn68gdNKnI0zXcHbD28p/mf0woWynoh53
	 PwdGgW/DjnmK4b/v3l3dwesfHoABZfCTcBjHYlt6ga7gTlj0laRkWUmMid20fegmUBNWs2QjLwQW
	 MBgiOJ0SQ0EhZo9Q4STWTo1aKB5mnbn9U0rK5Ut+GzeMyoRUCnHM8ExhvBGu9MN+PC8ggjU82Czm
	 9hpwFavcqL8nEz/rf+uXU2sd/7Pk4a7bbSFd7+gBle6Mz1n6XzNBbZ92AszB5UdRge0H8omIVT3o
	 ZzO3o5zCHXkrRYiSGyrnEJuAie+hSCHDLhG4ls7Fr2TaztsWS/sDOn8KK8Rv15qPR5FbhFh+z2oT
	 doMCtRxZPY+oDkAzUEs6NgkxpW/+JsWOV3BgRMneHda5zZqXaowTVOpJ0/M5+Jlem4AbItK5pyS1
	 QVxrHkVNVi1OsyE3w=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yilin Chen <1479826151@qq.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: drm: fix GEM object pointer safety docs
Date: Tue,  7 Jul 2026 16:02:00 +0000
X-OQ-MSGID: <20260707160200.2798072-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IntoGEMObject::from_raw() takes a drm_gem_object pointer.

Its Safety docs described the argument as a pointer to Self, which does
not match the function signature. Update the docs to point to the actual 
pointer type accepted by the API.

Assisted-by: Codex:GPT-5
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
 rust/kernel/drm/gem/mod.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index c8b66d816..90b256093 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -118,7 +118,7 @@ pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
     ///
     /// # Safety
     ///
-    /// - `self_ptr` must be a valid pointer to `Self`.
+    /// - `self_ptr` must be a valid pointer to `struct drm_gem_object`.
     /// - The caller promises that holding the immutable reference returned by this function does
     ///   not violate rust's data aliasing rules and remains valid throughout the lifetime of `'a`.
     unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self;
-- 
2.25.1

