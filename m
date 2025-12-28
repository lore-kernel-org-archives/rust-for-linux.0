Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFD525A2B4
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 19:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766949315; cv=none; b=JSXTPLv3A78df9HTbRIQkk5D94eb+rB7kapqbQ0xesc1ZQvl1dflSu2+cLPne/xhC7PgA2/4wzHz4wXBcsACS9EqLDebFFq39WX7ESsNN6pniyI4JQimrIlFy6sAiyVrPHdDdyOReFwlw6QaP5lbI9kaXuTeEja0+Eh9x+9u/co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766949315; c=relaxed/simple;
	bh=lHUeD5MRnJF79g8T5KfNq0B2eM2rTMYIWkpVfK9VRv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=noIOkeHlKl6CNs1IWC/N6rJeKwXpxMUz2iMLX1IQ1BWeaSjeJcKBGkx502EVG2SbP8NDrGhK9g378J3AMP8n/SZaayPxabEIAlAYnyZXg58rCzkB/yXN3cuOyDFCPV7tQOxr5Lgsnm5R9uWDm3MjHTV8av9c2NUWzGR8PEnGDA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=ZCXXYdRB; arc=none smtp.client-ip=45.157.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="ZCXXYdRB"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dfPbQ6qLkzHP;
	Sun, 28 Dec 2025 17:15:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1766938546; bh=b/YT5QfITejOLu98359QsjUWwXuK2a2Y3ksGRd/9OBA=;
	h=From:Date:Subject:To:Cc:From;
	b=ZCXXYdRBjm+0+ibuqg7IeaH6O8Cam9uRe7lOPAIpFhCms3OGB8cUsvHOxZy6vibZt
	 57wCH3DjmCKzzkXrNxJXpvJWmMaSSvZbfw29hcDN6+S0KVvlpsSXX2W1Ltb8kVx4Gm
	 7xnJjyBBo7vRJQGks1awRK8vaGWpUyuTQiSh/wp8=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dfPbP0sgpzCM6;
	Sun, 28 Dec 2025 17:15:45 +0100 (CET)
From: Ewan Chorynski <ewan.chorynski@ik.me>
Date: Sun, 28 Dec 2025 17:15:23 +0100
Subject: [PATCH v2] rust: drm: Improve safety comment when using
 `Pin::into_inner_unchecked`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-drm-gem-safety-comment-v2-1-99bb861c3371@ik.me>
X-B4-Tracking: v=1; b=H4sIAJpXUWkC/4WNQQqDMBBFryKz7pROMLZ21XsUF6lOdChRSUKoS
 O7e1AuUv3of/vs7BPbCAe7VDp6TBFnmAupUQT+ZeWSUoTCoi9KkVIODdziyw2Asxw37xTmeIxJ
 pxbW+llgo49Wzlc8hfnaFJwlx8dvxk+jX/lUmQkJtWDfDjdr61T7kfXYMXc75C+sQuJG4AAAA
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ewan Chorynski <ewan.chorynski@ik.me>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766938545; l=1495;
 i=ewan.chorynski@ik.me; s=20251226; h=from:subject:message-id;
 bh=lHUeD5MRnJF79g8T5KfNq0B2eM2rTMYIWkpVfK9VRv4=;
 b=CACRqhL3LbN6BYXZKRCNwHJ3X4JOSfmX70iL/CSagyz/MxiCA92XRHEkQzxi0xPAjDmGy/bCF
 aFO3WUONh7+CNfbyCylDq6HsmmZo+haiqH8DU9q9R4D3iQgFQMhqMYI
X-Developer-Key: i=ewan.chorynski@ik.me; a=ed25519;
 pk=Qzaw5giL/U3IFVpYyrZjtONgXMAOpXYyUsXRpiS8hUQ=
Feedback-ID: :31e4c416764678c:ham:e74197f626dda86
X-Infomaniak-Routing: alpha

The safety requirements for `Pin::into_inner_unchecked` state that the
returned pointer must be treated as pinned until it is dropped. Such a
guarantee is provided by the `ARef` type. This patch improves the safety
comment to better reflect this.

Signed-off-by: Ewan Chorynski <ewan.chorynski@ik.me>
---
Changes in v2:
- Fix typos
- Add Signed-off-by
- Link to v1: https://lore.kernel.org/r/20251226-drm-gem-safety-comment-v1-1-5ae56d8194b9@ik.me
---
 rust/kernel/drm/gem/mod.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index a7f682e95c01..ed11d9c0f427 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -210,7 +210,7 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
         // SAFETY: The arguments are all valid per the type invariants.
         to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size) })?;
 
-        // SAFETY: We never move out of `Self`.
+        // SAFETY: We will never move out of `Self` as `ARef<Self>` is always treated as pinned.
         let ptr = KBox::into_raw(unsafe { Pin::into_inner_unchecked(obj) });
 
         // SAFETY: `ptr` comes from `KBox::into_raw` and hence can't be NULL.

---
base-commit: 6c8e404891e1059564d1a15a71d3d76070304dde
change-id: 20251226-drm-gem-safety-comment-1152e457575f

Best regards,
-- 
Ewan Chorynski <ewan.chorynski@ik.me>

