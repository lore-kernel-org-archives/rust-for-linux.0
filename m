Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D5639C637
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938932; cv=pass; b=OD/4e6enrZSGHFBedrQpWNMwrz0Yytyl64w+xztBQfWUar6oJI0/+WKir//jdxZU2EXv1tA32/ifRDcKbz35vvHEhhR6ZpNAAzUEBZn10s5ptc0LH1bY2Lpui8zQC9xvyrmpUKengqOSCdXpCR/iB97PKOJKTdjYa4Pb0nOMjmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938932; c=relaxed/simple;
	bh=sPMsIShW6+JzdEs6DF3qKrshI97G8GP0myyovWnwiSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGWOMXkUdgc9XRn7gnW9s6yVGxsljceoXlScgr2EJGmfnR7J9j56GS3mVsCd9vu6v/YFCuoNDVwQZtSO+SgLJWlDaBPV4MiVFJH/g0Gotoj2wZmi2mxAts2JMfdX8msAmTGhihEHkpy60DCDS50s3HfksaBEEodjspA0WgaWVKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E2Yo4hFB; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E2Yo4hFB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4398913af88so421129f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 05:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771938930; cv=none;
        d=google.com; s=arc-20240605;
        b=f+yqKXDFf/KzgDbnHqNCH1ye9ZvKXz9+hRbVfqO7kMgvUmVKOVLTh7PwzfI9kMtUdw
         qwGS1WIhgoqflpXkM5dU+F44lYhyxVc51CaXMr0Nu4yKnvyUIyVppNhDs4vxW/A/n6aR
         G3dJt3DuxK6a3O7m9aQl8o8ENFAD13qQpiZ1BOVAb59Y2gs6vWJlC1xOWWdVA2Sn9fwf
         rChatYv3v02pBY8yWL2PE+3JiDMlzt6o7TRSMWWq/9ix5CjQwHdl8hM9eCzzDd/lz7Ef
         bthqid9ywP8hPHzmQ0lU7R0eFeym1mvX2/R4aHYW0DhvC3P2EZmafT+c1y7EPNeRDo1A
         2rOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gWMlp1ruVrvPjA0cNiKtCr+diAV+Slyjy18uMqXnndQ=;
        fh=/4SOMb6PAq0RFyV45z0rgu3L5We2y3CoTbHR4mOm4pE=;
        b=drF0S520hAQlqTnBl9PS56OElPUkVp6x7yjRRbFVLxlKRVOgAf/Htcv+ttNKynWHYH
         mw8ecifpBB+JB0bA61rZ9cyVup03rsCIUhxyG5VyYf0zMkIhhkIh2KPuOR9wgDgi+Mxt
         lRM4+J4yd13HaA1bAjfrIZ7/vXXSf7PSmJhHLRUazNIq+L7d5SU1iL/zDrNfJCrvI5ID
         eil8qxVVffKQNHu4gpE7W+NlzEXi4UEq1Z8xN6Ck2hfViwQuWmVZGbNzQwVaNUNxVbuU
         ftS5xP8HfQKoK9YMMAf9hnrejhS+GwzjG6ztG8J8iOjfZfzaH2OubJPIun+gnJ7/i6JR
         UJ/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771938930; x=1772543730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWMlp1ruVrvPjA0cNiKtCr+diAV+Slyjy18uMqXnndQ=;
        b=E2Yo4hFBetSWe5UGiLMiA8/3CaSH3nfxGdUXh46YhTg12+mbeQHdCFB6EMhU5mgXgN
         G2BgeC/bc7quuodKWaorjMh6p79znwrktOFyBqtNfKConY7k3qEofOd+RHc0qevaC3Lk
         gShCfR8m7tDs03Xjnpv8BQ+9aJok/n03pV1j/yJLVfTUYVedoXv3NJHO4Y5wJ77BFxNZ
         1IU1iJoo9Wntji4bwRtWKRgjzSXBHbRIfscQ7KB5eEvxA1wBla61Xp3LCCR02C7maoqd
         Z72o/vY5HkVjsRZuFY27rY+RO1CcinQ4biSzuZPj65gdX8h/9/+sp3RaDrM0yvxenRej
         Q5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938930; x=1772543730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gWMlp1ruVrvPjA0cNiKtCr+diAV+Slyjy18uMqXnndQ=;
        b=cGNolOWLh1pD3yE/0SBQh3J4YTek08IqBo8T68ZtiLIbsgyVQY18YL14tTaXtobUii
         DxuyUQDFrzB42qg2WRJnVpr49p67o3YwJsZmn4c+ROsMODfq0ivhQ05rq27a/8rsh8S3
         Vql+XZ/VB51/8VSeaYKGxoWND+FpYoXCEKJXNOgZiaSQO8Hu0z9KRJmnHJzZv+bb7ubW
         X+rup8134LX6s6XGqOUOyZB4q3PXJ0v+VK2e6FvlhMQu8TMGCcxJNeKcDx2A+tBYybnt
         jZCem8cX5tkjYC/Cu7US3Qk8U1NWiWU2YBz4YewAZ4+GYruNluqTIARi8luN6kKkTpsv
         XNSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiR04DFspOuo6BDKcaOhSf/K0ehmP40/2Cu7aK1EY0z8jI1w7YnytiokiGke6PdSvgCqy8hwXX0J/fsh+KqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxds8hKbDemh/ksANeUzYJRbCqbsMUNZDVq8Olh+o1LzwEK+sZY
	PhwKadiFwfjWufJB+baB35sDQsMKGrpq4EvkA9rKe2ASMuQxzzbF++GwLpKUj18eH6z9g3yo3Mc
	AU6zMpYsjr0aKYS+TcC0gxiZeb4Wczu7mR2lImowr
X-Gm-Gg: ATEYQzw1yMHTXF0DMN99zfO6o0HPU8ZCg7zvBgcjcXKWO+ZTQzYp+38Pswobm1xCX11
	L7VWImlVtBZe2VhFkwsg3Q/5/oIXT40kKNWoDrVw22+pKq54+2Je+AtxkLizUimMQX3mCAwVD3z
	+iKCed6Z/fOa4URYlOw1vM4DAVA2j/OIX8dr2Uv7/MW3FyLMUXXdFzObS7fkDnTfooIlaBW/DCv
	QrKglpRBunP0Ncvxk1bOrssx9mZ27E7sJ68KmDTRqYS1dherJ3CJhli4tTW6fwMndl1i07NEIZ2
	/JUBLsg77Ot/NvTZoVNAoBhvWRJhaChONJSvutGmi0UTlyna
X-Received: by 2002:a05:6000:1448:b0:430:f7c9:94c3 with SMTP id
 ffacd0b85a97d-4396f16fa74mr22881313f8f.25.1771938929192; Tue, 24 Feb 2026
 05:15:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Qrs5fItWst004EC_jGHvnTB2s8QuVM9cnRKIhUuImhaSV8qhL9DmqifhAqLFPSEf1JYNS9J-1hWqvptIARahvQ==@protonmail.internalid>
 <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com> <871pia2wcp.fsf@t14s.mail-host-address-is-not-set>
 <DGN7R1LIMMXA.PAEGCW35B6EY@nvidia.com>
In-Reply-To: <DGN7R1LIMMXA.PAEGCW35B6EY@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Feb 2026 14:15:18 +0100
X-Gm-Features: AaiRm53j0jWe76VxFKuxCY6gDGFxEl8Y-H3mzmvgtlc7JiyapeCcfXycaAcT4_o
Message-ID: <CAH5fLgj_=N1S9_YNmmpKYsC13j_E9JPRLCUha=eUEbzmvkDQCg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 2:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Feb 24, 2026 at 8:51 PM JST, Andreas Hindborg wrote:
> > "Alexandre Courbot" <acourbot@nvidia.com> writes:
> >
> >> If `CONFIG_PRINTK` is not set, then the following warnings are issued
> >> during build:
> >>
> >>   warning: unused variable: `args`
> >>     --> ../rust/kernel/kunit.rs:16:12
> >>     |
> >>   16 | pub fn err(args: fmt::Arguments<'_>) {
> >>     |            ^^^^ help: if this is intentional, prefix it with an =
underscore: `_args`
> >>     |
> >>     =3D note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) =
on by default
> >>
> >>   warning: unused variable: `args`
> >>     --> ../rust/kernel/kunit.rs:32:13
> >>     |
> >>   32 | pub fn info(args: fmt::Arguments<'_>) {
> >>     |             ^^^^ help: if this is intentional, prefix it with an=
 underscore: `_args`
> >>
> >> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK=
`
> >> is not set.
> >>
> >> Fixes: a66d733da801 ("rust: support running Rust documentation tests a=
s KUnit ones")
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> ---
> >> Changes in v2:
> >> - Use a no-op assignment instead of the wider `#[allow(unused_variable=
s)]`.
> >> - Link to v1: https://patch.msgid.link/20260224-unused_var_err-v1-1-c5=
1d805eceb5@nvidia.com
> >> ---
> >>  rust/kernel/kunit.rs | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> >> index f93f24a60bdd..a1edf7491579 100644
> >> --- a/rust/kernel/kunit.rs
> >> +++ b/rust/kernel/kunit.rs
> >> @@ -14,6 +14,10 @@
> >>  /// Public but hidden since it should only be used from KUnit generat=
ed code.
> >>  #[doc(hidden)]
> >>  pub fn err(args: fmt::Arguments<'_>) {
> >> +    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a=
 build-time warning.
> >> +    #[cfg(not(CONFIG_PRINTK))]
> >> +    let _ =3D args;
> >
> > I think (didn't test) that you can use a conditional attribute [1] inst=
ead:
> >
> >  pub fn err(
> >      #[cfg_attr(not(CONFIG_PRINTK), expect(unused))]
> >      args: fmt::Arguments<'_>
> >  ) {
>
> Yup, that works as well, and I think I like it better as it is more
> localized. Alice, WDYT?

 I think the other options is also quite localised. It's per function
argument too. shrug

Alice
