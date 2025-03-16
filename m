Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7C8F5E
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 19:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742153467; cv=none; b=t+rp+OWoDh2zAFidug6xBtNY8g/3e7EnXM55rg2XREZx5C1ihYM9y7+f4X0krx+cmzH0se5G66J8IJaK+yQF/Sgng3ATcFnRvmf5F035Jba8s4C12WDJsACASEpHkcqR42CzNfJ3CtJjpayd5MNIXMRbP6Uq3pozLyK1dfnx7R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742153467; c=relaxed/simple;
	bh=6fMh/KO7r3fddggeE+UAk1F3YCBOtVtUeXD0QN/Y9BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWWxl05iv+IQVxBmpBUn80/vIyilqsuOqQnvjoU4HVe+IErKWACwj9H+fckd6XCoQ+GT4QiOS2fhxkXV8uEuiDw+AToG2cKn5v3wI/evHGyzYcKqhVTTGSSfj57M6XBXP9B56R83O6Bg0BI5PpV5hZmMG1WqH7j9RCnFF0Iasv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmQtBdGH; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmQtBdGH"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso41721911fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 12:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742153463; x=1742758263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltsWqP1J7aEatHHxuDQSkITD72tShxNn1G8Q+1Sl9pY=;
        b=YmQtBdGHry3RDCyLTqms7OaFZ0jIOUyjV+nRiSuZwOXO4uRDdQOTpt0j+SrinoYvef
         S5+EK57bYfTog2gieXfRFoqlwhZRwQtVdmCsuG85s9okpKytZ8mkwddeKqlbu5JOaPk/
         PPDMsQzJaVqTZewjatH3pNqQTgSqRKmbkdgLrmA+9gXdPEpkkTRtU2OLLDmVnxtgl+bZ
         /Uvq9wIrOPDUw1wQMZIt5lxbMnHjtMHHnZclfewIgKWUz2BxHvPxsxB04fvDwBP6py7P
         SFE5bAgk6bHGiMZHLsRqBhmGOnInaqX3xw3XFdwl4bMTVpfd76c4zfFu7Ij04YdUV+bU
         wAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742153463; x=1742758263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltsWqP1J7aEatHHxuDQSkITD72tShxNn1G8Q+1Sl9pY=;
        b=U8+P9TVaC9jtA61oBXbBsJHDot2UBWVIAZfzG1c8daTi3Pg7lEI1vBmxqi617J3XdM
         Z+H0vasgL27a1EKMGSxz4CHWKZNQVJdo5o5Wbk6eB8y+lU6Z+fTy076a+bWbeP0bBm8n
         fPgCerER2/w2aDcdH1MwTygRbBUyjRfjdL05z4AQbpqo0ikBYWrTGr7VvQTG2XZc475B
         86yFfljXDkkaWMf1Y6A3OZEoJK+/mNMUtn9XRnU1zlEpgiHN4MJS09WgUUijrs/CrPoH
         AM+V5C4Zs9Nw9DRwdCj/uCpbTyx8W73648srRGuV5yUK7YFOikJXXPsiIAu4RvFKpUFA
         Bolg==
X-Forwarded-Encrypted: i=1; AJvYcCWG+/lYsu9SqkejAGcpwftLh6AoUgOP3MvRC3gHkguxMXQCLDLnRH2KTvdk9b//vPhmkoPF1c2qe224g8+b6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoBK++ffrP7hcbOtn27WaZ9oMTJL3ltQl6jm8RJA7auTyrdLFO
	aKdUE9V1H11NK0tjeG1Zdezip6uyJTy86Y/I66YM4Vh1HE3LoFchCe6Jo2Tug7GcLihBfzDPKP3
	8mKGPBldc+PbILuzYN6KnYANfbr8=
X-Gm-Gg: ASbGncsDMIJGHDfivjYqTF2SiRlGPtCNR3mYIBSihH7MPbLalDW3m3woSX+VDOgCpbQ
	7l8USqpaBcmrFXftV7+dT+nWIlqAoBb+XzFmumu213WazZHBdTVsDuFxTi5entxRDYzAWsnuDym
	RmOtPbTNC02y3prsGJlszCmVPhgWsMP7Zchct9RHRp7mgFn4gV7njN/uuC7OGL
X-Google-Smtp-Source: AGHT+IFVpb7QrKzMS4WLHFa980aO2e0zchvCurhgneRBgTP5DFirkGApaG+0Hi4zml+lIg+f5LAuN1W7X2Di+SVLx5I=
X-Received: by 2002:a05:6512:3e14:b0:545:8c5:44cb with SMTP id
 2adb3069b0e04-549c3921986mr5035099e87.31.1742153463221; Sun, 16 Mar 2025
 12:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z9XIk3WpzruUfh6O@pollux> <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
 <D8HL95D099MI.2N779RERY6DAE@proton.me> <Z9bEosVk8-0sgSbw@pollux>
 <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
 <Z9bLtgJa3PNB0bkf@pollux> <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
 <Z9bWODCNNEq3xI51@pollux> <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
 <Z9cfkKTVKtc3imyK@pollux> <Z9ch0fgUI-V-rlGr@pollux>
In-Reply-To: <Z9ch0fgUI-V-rlGr@pollux>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 16 Mar 2025 15:30:27 -0400
X-Gm-Features: AQ5f1JoZW8eZusfevGhodh447R6aTeWicamaa4XBwmjmyvCeedShoj0pIzK07ig
Message-ID: <CAJ-ks9=b-uMCLMMKT-9emgrrUXeaA50DBSEAWjSD+uHHZu-i9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 3:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
> > But let's define it then; what about:
> >
> > "[`Vec::set_len`] takes (or kepps) ownership of all elements within the=
 range
> > [0; `new_len`] and abandons ownership of all values outside of this ran=
ge, if
> > any."
> >
> > The caller may take ownership of the abandoned elements."
> >
> > I'd argue that giving up ownership, while offering someone else to take=
 it means
> > that it implies that otherwise we'll just end up forgetting about the v=
alue.
>
> Btw. I'd still prefer if we could enforce that the caller has to document=
 what
> should happen to the abandoned value. But I acknowledge that the safety c=
omment
> isn't the scope for it.
>
> It'd be great if e.g. clippy would give us a tool to do something analogo=
us to
> safety comments.
>
> It think it would be useful to enfoce some additional safety documentatio=
n. For
> instance, I think the kernel would much benefit if we could enforce that
> mem::forget() must be justified with a comment, since as mentioned ina pr=
evious
> mail, it can cause fatal bugs, for instance when used on lock guards.

There are other examples; ManuallyDrop and Box::leak are two that
immediately come to mind.

But focusing on Vec::set_len again, could we return a mut slice to the
tail when new_len < old_len? Something like:

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c12844764671..e5f857d723ec 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -191,9 +191,16 @@ pub fn len(&self) -> usize {
     /// - If `new_len` is greater than `self.len`, all elements
within the interval
     ///   [`self.len`,`new_len`) must be initialized.
     #[inline]
-    pub unsafe fn set_len(&mut self, new_len: usize) {
+    pub unsafe fn set_len(&mut self, new_len: usize) -> &mut [T] {
         debug_assert!(new_len <=3D self.capacity());
-        self.len =3D new_len;
+        let old_len =3D core::mem::replace(&mut self.len, new_len);
+        match old_len.checked_sub(new_len) {
+            None =3D> &mut [],
+            Some(len) =3D> {
+                // SAFETY: ...
+                unsafe {
slice::from_raw_parts_mut(self.as_mut_ptr().add(new_len), len) }
+            }
+        }
     }

Would that sufficiently communicate to the caller that they should
deal with this memory?
