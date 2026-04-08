Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C052D29C8
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 09:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640486; cv=none; b=FjvJE8F95CqrcU1j6cC6tV1ePti3IpeuTJ7jquAnEu3A5CFCJ36/lV2eQG/sXdMGaZZi4CWOUo7NnMQiiT4iyZwplwUyx6yOULuP2XaAiYQTycqpay9FQmlhDs90ZzZruSs6hAJTbhGOd2erWaV8GUAHneXZwn3aGz0Xl2EsTNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640486; c=relaxed/simple;
	bh=k7JTLzbdn4fHh+iHnj5TYl9MSpr3vls6J3Hhu47Mk+w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktr4LswGHpUCTeOipX4ZX+v9+wj52xGOEigqumCZ9UpU4RFsQq8QS4xZdlCaK9NtRw1hwkso0b6BENe1G9GvLcw7hWxkK24cek4Wn469cuyfnT8ujhok+u7y6SvPV/C9+IDAd84wUPPK31fPdWjrmetZa6AXQb0Ko/mqeAwm97Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=victorprokhorov.com; spf=pass smtp.mailfrom=victorprokhorov.com; dkim=pass (2048-bit key) header.d=victorprokhorov.com header.i=@victorprokhorov.com header.b=KA/nl8Je; arc=none smtp.client-ip=109.224.244.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=victorprokhorov.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=victorprokhorov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=victorprokhorov.com header.i=@victorprokhorov.com header.b="KA/nl8Je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victorprokhorov.com;
	s=protonmail; t=1775640475; x=1775899675;
	bh=JyxBOjnl7A/TDkOdwEyUIDe1x+0J4hXPb0y8KUvxvEE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KA/nl8JeVmREZGNeEaD4FYUfztgJ1lHE09lFKTK2iPjeZfMHpXB7tFy6GFjBzVFO+
	 mffKt3bP3nTeHULeA0tDm3iKu3wIhYKQ4Xq6m33DGqMVc8jJKo+MXxTSQO5/0+MMhE
	 RkFBRJ1WWFpc8U+XQsyZ6VX1IHwoBeDuCL0YOlHDEvM4f3tbScq+I3COOeTG690ecq
	 vQCWUct1bghajKnE6kKi7ojSu61dC0/WXi9aT1mPnM0cvp5++bx1C89PB+QQJgkCM5
	 Oni93HRLZVvRmCPDPesSV6bj8GygLYcV4hlY+3TCnthCOfw85JRZ7I7hZO8tjCQE3J
	 o6pIswQeJpHzw==
Date: Wed, 08 Apr 2026 09:27:51 +0000
To: "ojeda@kernel.org" <ojeda@kernel.org>
From: Victor Prokhorov <mail@victorprokhorov.com>
Cc: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Victor Prokhorov <mail@victorprokhorov.com>
Subject: [PATCH 2/2] rust: use `as_{mut,ref}_unchecked()` in a couple of places
Message-ID: <20260408092621.580364-2-mail@victorprokhorov.com>
In-Reply-To: <20260408092621.580364-1-mail@victorprokhorov.com>
References: <20260408092621.580364-1-mail@victorprokhorov.com>
Feedback-ID: 108936981:user:proton
X-Pm-Message-ID: b24abc21040fc0871634b347146984eb85b2d73f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Victor Prokhorov <mail@victorprokhorov.com>

Replace `&*ptr` and `&mut *ptr` with `as_ref_unchecked()` and
`as_mut_unchecked()`, expressing the conversion as a named unsafe
operation rather than a syntactic pattern.

No functional change.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1225
Signed-off-by: Victor Prokhorov <mail@victorprokhorov.com>
---
 drivers/android/binder/page_range.rs | 2 +-
 rust/kernel/net/phy.rs               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/=
page_range.rs
index 8e9f5c4819d0..ecd77c6a9e30 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -672,7 +672,7 @@ fn drop(self: Pin<&mut Self>) {
         // CAST: The `list_head` field is first in `PageInfo`.
         let info =3D item as *mut PageInfo;
         // SAFETY: The `range` field of `PageInfo` is immutable.
-        let range =3D unsafe { &*((*info).range) };
+        let range =3D unsafe { (*info).range.as_ref_unchecked() };
=20
         mm =3D match range.mm.mmget_not_zero() {
             Some(mm) =3D> MmWithUser::into_mmput_async(mm),
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 3ca99db5cccf..221c50ccbfa0 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -88,7 +88,7 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) ->=
 &'a mut Self {
         let ptr =3D ptr.cast::<Self>();
         // SAFETY: by the function requirements the pointer is valid and w=
e have unique access for
         // the duration of `'a`.
-        unsafe { &mut *ptr }
+        unsafe { ptr.as_mut_unchecked() }
     }
=20
     /// Gets the id of the PHY.
--=20
2.51.0


