Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4061C3BEB
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775254103; cv=none; b=UXv5uax68gKXNhQJHMvE/MfYT5OFpI3rqP2PdNV6rQkey3kBopa1w58Ppl6TuPT2j1jfNt536St6lGbdzIFl0j41jU5pLpNcDFs6ZeIzqq6R/GfxxP1YtpYL3ETo9FseHHj/sqiJ9pXeQGMXEPZgkxinGByClCx+ZJGbfmfMAek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775254103; c=relaxed/simple;
	bh=V+pWpEB2ZE39DHy9LduUpLF0nN9C/+Fi16ngIT0Kb2o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KbyEvCRrZisM4m1x/C+hPDDzSyQifRXVTyHqBCP1kHCL6cgTQxhLmt157Esrvf3glLwFMVVJbaoB2+VjxsOdRcilVPPn8PNRDQ31cUSd10PsgLVQYdRQwbU/GjK0IcQm7bAAWJdTPW0RTW75bUAsuOYQywbsLrSqsrgFFvJcyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch; spf=pass smtp.mailfrom=protonmail.ch; dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b=deBujLwQ; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="deBujLwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1775254100; x=1775513300;
	bh=bhdNR+n7WfMa82BOWYJSu9DrhOQusp2ha2stPA68Bog=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=deBujLwQOEpVBDesu4ILQ01wBUVcOMOuanPAysq3ep9wL/UTvpTjD1zdWSG4HHm5Q
	 eKEUDitHhV8wcD02duy9oWEdi+zAihh5uV0fyhs//5CtWduvr0LV1tzF0/WDt19FjX
	 Y4T8LyXLgENzJkoiiTQ/jnwWL+qYXILq6RdjY016STedsimcfz2rUybkmzXsKGYzHT
	 gNYUQVA7T4OJgYfq2JhoK5MnfwwIgRVscRU/9WhZZ17VykbHXeNwltswI96haiKXuw
	 R0aar2nm69sAAPtkiCHcqu/NDpoNqGk7soxtajKyZCnPpnMBaNXIye1a3e+7pDTLck
	 SaSBZG16IiOqA==
Date: Fri, 03 Apr 2026 22:08:15 +0000
To: ojeda@kernel.org
From: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, aliceryhl@google.com, lossin@kernel.org, Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Subject: [PATCH 1/2] rust: list: fix SAFETY comment in List::remove
Message-ID: <20260403220751.15374-2-t1bur0n.kernel.org@protonmail.ch>
In-Reply-To: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
Feedback-ID: 190658113:user:proton
X-Pm-Message-ID: e8d6b46fc764a261179c344460c2e17f0d760f23
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The SAFETY comment for the call to ListLinks::fields in List::remove
was left as TODO. Fill it in: the call is safe because T::view_links
returns a reference to the ListLinks field of item, and references are
always valid and non-dangling.

Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
---
 rust/kernel/list.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 406e3a028..b5705af43 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -599,7 +599,9 @@ pub fn pop_front(&mut self) -> Option<ListArc<T, ID>> {
     ///
     /// `item` must not be in a different linked list (with the same id).
     pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
-        // SAFETY: TODO.
+        // SAFETY: `T::view_links` returns a reference to the `ListLinks` =
field of `item`.
+        // References are always valid and non-dangling, so converting to =
a raw pointer
+        // via `ListLinks::fields` is sound.
         let mut item =3D unsafe { ListLinks::fields(T::view_links(item)) }=
;
         // SAFETY: The user provided a reference, and reference are never =
dangling.
         //
--=20
2.53.0


