Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9D621C19C
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 18:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741027256; cv=none; b=NrGTEgX79eUbpchFu5/FL7wAXagv1mS9FtKbBg5NzyvjhAachqlLo5TIYZwUY1HOR5E+jiPGWz9SP9AY4CjU/Zvgy/LS8VjlrvJfdr/XP7fT0fP/gRtR/0T3y8N9vuo97g+DDZp7O9mhdAWgSKN2eJzXlv//c+bXhpu8t0Ss3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741027256; c=relaxed/simple;
	bh=nrcUawcCsSZ4sKk198mMgykA7LrBZL2L/S12GQRvXEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTWMe3tKC327Utqway2oT4fQiJdHgVQ/tvn/Ks65NmIxfhqkSb0PoB9S2J8zEuDE8E2k6idVIhDc6fkBFvq7SgFNeqMWHQI24gtwigdh8wP/09+0I+QBwYRZNrF+JYNRAIXcCZqYXkV3haXj10owkN2cxW47lHxYRmwIS0Aruz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ovYxqr1v; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ovYxqr1v"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390ec449556so3654073f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 10:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741027252; x=1741632052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=op8ngrfBeKcfAHC0fBDhWmrr+hR58OWpJPg3ZrZyuIM=;
        b=ovYxqr1vOCW+l1w82H3JnLVSQNzOwhYUwWsSDS84VPdA57fjFUDsVTTdyigTjwYGAB
         JDvmDYfmj81DuWiYvJy9/Qz2FovKaTR2JRYYE3W94bYBoaik1jr1ityRBDqIi5s6rjP6
         px2WtBLOi+Ur6O12ZT8IOyEF4aMilTtTfm7QeKIfda45/HH4BueZ0U1R+V7Rt9UHrlJ2
         zMl/0gvueMfKJqQLT8LZoNPQJhS8FoaR+m5rV0v25lFZ/Pn3o0zXZdBc72g8h9ALUKa5
         kSvUenTIWenwwwJvYuqtVLeWWRmMrRjBn8tcX+HdQhvDTIVLyU1jej1cD+wKUGbjqkPG
         knVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741027252; x=1741632052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op8ngrfBeKcfAHC0fBDhWmrr+hR58OWpJPg3ZrZyuIM=;
        b=QUPVhaSIssyDMWcckzgLrmX63VvhVq/SRikGQrmN8QXLy9pBg9SW8X4gS5xGjWUe2i
         XL6wdwnwDLga29R75O4yTyuGnwVhBcFdQNgwWj2PWJEoemCypLPSxZicq2fTwNrOl2xj
         pa5sljca7gUtTBLqVMKgJ6inWnkMjl3eVH5GHHezehpvh6reSEX77FabSizEZdXnSce6
         Hk7I9ir3SlUSr0GEHAmcGzYD7NjH7BtXgvS6O1U9OYU6TFmNDqOaKEif1HSVcH6coeBj
         F4WJfRFmjIsqFM9Wdc3L+ZtC8kbZC/ACUO3dAOYxifKpf6XK1+/xCT4wUs9zXwDSfvF3
         3uNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdnV6sXSjg44nEF/DE3BUNeBoFFF8N2a+Q87y45rW4i7p62Po6ch9J7dN7vDEC4Wx5dTF/Gu840q+/d/3y8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsa2OdpAuGBpI7EnUrzrrhwMCtPGmrvXym2B+0V29lWeZtrluh
	Ppt3dlyeCa6XZjNM4EUALAw0uxg8zZrUCOSBp1wnQ6eDwMUI15i6AqeH0nyfwD7O+t/dYXmrq9+
	XxwN17f/k6VeI9RQuNv85hn3RCy9W+thRmtJ7
X-Gm-Gg: ASbGncv+PbEUQXajfUOzLM4xL3CVlFPMiCoCDuJLIVhTevD7cN7Rb3V9dRW2M1GANi6
	STx6PPaf1phQZbLRR6hZR4PtO9TYHo83ivKKUy0vBTDf5uv9teJT+6BqIbAD+0T8tMBgAC2a5ME
	j/ocpXBCIz/Yt52WBC9d5CrA4DjPs=
X-Google-Smtp-Source: AGHT+IEbQAEL5lhQtMyWI2oz7m9QxyO5TIMYD/e1+uZr6W8jisydk+E/Pz2wJklAZ6U1BmFRXEb0dlT7aUP31FVHKCw=
X-Received: by 2002:a5d:6c6f:0:b0:391:a43:8bbd with SMTP id
 ffacd0b85a97d-3910a438dbemr5878386f8f.21.1741027251940; Mon, 03 Mar 2025
 10:40:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-inline-securityctx-v1-1-fb7b9b641fdf@google.com> <a5262d73-2b11-4868-9c6b-1c6161808979@schaufler-ca.com>
In-Reply-To: <a5262d73-2b11-4868-9c6b-1c6161808979@schaufler-ca.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 19:40:39 +0100
X-Gm-Features: AQ5f1Jqgc_xVRRc4yVQL3FqBf_jvG-GoH8NZo9p5eLE71Ktv6MhF-CyIro8CARk
Message-ID: <CAH5fLggNnOv2rhtUeK38GVQ7EuuZkZMwOSVKSsMLFG5eS2i9Ng@mail.gmail.com>
Subject: Re: [PATCH] lsm: rust: mark SecurityCtx methods inline
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 6:07=E2=80=AFPM Casey Schaufler <casey@schaufler-ca.=
com> wrote:
>
> On 3/3/2025 7:29 AM, Alice Ryhl wrote:
> > I'm seeing Binder generating calls to methods on SecurityCtx such as
> > from_secid and drop without inlining. Since these methods are really
> > simple wrappers around C functions, mark the methods to inline to avoid
> > generating these useless small functions.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/security.rs | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
> > index 25d2b1ac3833..243211050526 100644
> > --- a/rust/kernel/security.rs
> > +++ b/rust/kernel/security.rs
> > @@ -23,6 +23,7 @@ pub struct SecurityCtx {
> >
> >  impl SecurityCtx {
> >      /// Get the security context given its id.
> > +    #[inline]
> >      pub fn from_secid(secid: u32) -> Result<Self> {
> >          // SAFETY: `struct lsm_context` can be initialized to all zero=
s.
> >          let mut ctx: bindings::lsm_context =3D unsafe { core::mem::zer=
oed() };
> > @@ -35,16 +36,19 @@ pub fn from_secid(secid: u32) -> Result<Self> {
> >      }
> >
> >      /// Returns whether the security context is empty.
> > +    #[inline]
> >      pub fn is_empty(&self) -> bool {
> >          self.ctx.len =3D=3D 0
> >      }
> >
> >      /// Returns the length of this security context.
> > +    #[inline]
> >      pub fn len(&self) -> usize {
> >          self.ctx.len as usize
> >      }
> >
> >      /// Returns the bytes for this security context.
> > +    #[inline]
> >      pub fn as_bytes(&self) -> &[u8] {
> >          let ptr =3D self.ctx.context;
> >          if ptr.is_null() {
> > @@ -61,6 +65,7 @@ pub fn as_bytes(&self) -> &[u8] {
> >  }
> >
> >  impl Drop for SecurityCtx {
> > +    #[inline]
> >      fn drop(&mut self) {
> >          // SAFETY: By the invariant of `Self`, this frees a context th=
at came from a successful
> >          // call to `security_secid_to_secctx` and has not yet been des=
troyed by
>
> I don't speak rust (well, yet?) so I can't talk about that, but this comm=
ent
> has me concerned. Security contexts (secctx) are not destroyed, they are =
released.
> While SELinux allocates and frees them, Smack maintains a list of context=
s that
> is never freed. A call to security_release_secctx() on SELinux "destroys"=
 the
> secctx, but for Smack does not.

It's just a comment on a call to security_release_secctx, I can reword
from "destroy" to "release".

Here's the full context:

// SAFETY: By the invariant of `Self`, this frees a context that came from =
a
// successful call to `security_secid_to_secctx` and has not yet been destr=
oyed
// by `security_release_secctx`.
unsafe { bindings::security_release_secctx(&mut self.ctx) };

Alice
