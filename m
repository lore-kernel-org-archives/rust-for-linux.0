Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021048;
	b=o3s+ZyaEsMCokM7OQyktFaPYHXLF4dov0FjdMgw8hNoe/OgE8YuAmCE0W6YdoLkOnFKc
	 W/uajIT4Fg2nUovBhaX/CYbrY/pIgAea3nIsCWt06BG52/p9ZxQaOjGo9neaP6GhfoMdH
	 iSPBAjhhqO4HxArsJvGQWs/g7/164hLmhl7APht2yZ5CrHp4WZrGmaW4MOi4O80Mzd6j1
	 JXbnLanh7iZbfRhFlJqKAyokR3/CKIIh4QzFZ7UwxlGFqnFu7WH6PCQ0pXIoXd2AivR/z
	 kO8K0h++uGxompxvN2AJFURHpns2p9spxb85S6Fxt2qhFMFLsSXNDn9d9VpWNr3Y0yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q4KDOTPdWsAvn5fnJD2QpV13fNXrFnBH5XSZbqxlxTc=;
	b=J5coj3F8l02hSflK5N8HicCP4ZkYIiVJAH9RgCSFFOYTx6RiB6ERyjbMYXasLtmn4KS7
	 18vKPYSt4Ax/X5fHfOyEzdBFaYVcBWKz+joPZATHkWAmZ9qdWqwI3drRPWBpx9zU9pGno
	 dtfg3Ee3d3MIv24txW4MY6BZBrorGR8RJDEY7nLrQv1JlOagfQFpREF8gnKlqFidlG9kC
	 CfAEgOXppWCr8nnGfcbKGwCCZDRc4oFSfxOJ8aBOO4JcyPJpPjoK1quaoAKg2+jAN4x73
	 XFS8CV5rwbw6YrWz8y5yL1prmTVkO3hxl7nhECdz5qfqFW9+R4d8ac2Wo3KEIpzQrEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDbaeCUk;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1E860A2611
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 16:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE1E860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDbaeCUk
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a42b34e930so988130f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 08:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795021046; x=1795625846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4KDOTPdWsAvn5fnJD2QpV13fNXrFnBH5XSZbqxlxTc=;
        b=gDbaeCUk4GIRuxDdeulzhOU84d7EBOgDmBW3pOzJDe3LLdN1nTHx/eqr38pjPOmtPU
         ZZiSrhlKPjhHiIeMLGGoVnBZj7UvbiTbgmzaEW4zDTAm4UQove74zVlNSNaj/DIY1Eh8
         65MATJR6ts2TkdIZsG7eDeqh8gICNdODo4FzYaj6iZEFhCLNZmqGG4swtcESCxRFzH2i
         7A+vuoQFVCuN8NyMeEZdXnLDyXBSNx9mFjLFf//TTfB78DE3YIZTp2vZGzbpN3QZw8bs
         vIFDglROm6lHh6pLIlRQEoSRIGdrelE//UvVbtHMUAtyCQCtm61WNdYJR92PJPwJhQwf
         ijzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021046; x=1795625846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4KDOTPdWsAvn5fnJD2QpV13fNXrFnBH5XSZbqxlxTc=;
        b=1eL7D+JcZmLfsM/DYLfO/yJQ0v8kgHQwhUhLRuAQRUp0Fz7m2x4/gVGBwyBe0jcqsD
         Fys2FNwwfT8ji/sP7J1Fg8NG0jrn7xdZ3sbjIF6/igdhK4SYRixapz6rXwNkAonWRo3G
         ZqTg8Hn36Rl/s6WxK8du3OS6vqRjp2I8sD+DTufjWKPR4bEgRA0t3nPbUfktv4tqc60M
         BSrxiL4hF2PbfraxbiYbaIwA4W17cRQCvVHOEmPDKgB45Je+ML7yppF0Qln4XjSJcIok
         4GngGxp8ywETGXzzPhyinxWAkXOdW07/1epksf1n91mpuchKvNbcIm+uJnOmI+6rYpJg
         TqJA==
X-Forwarded-Encrypted: i=1; AL+hErHpsohbT/1qyTZa5t/mI21MlNn/MozkvndkMWMH5lFNHU07nYFzz7n9YCeNApdK0MESC69UZMGbQSDNPsVmMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kKK4pzi4cvCw1Y9z5xDoAef+gvO8DG4WtAVSQCILTT/L0Cd/W
	8xyhjbriWOSRgb3mFBbZQ/raBauDcy0Q9rNcreVzmnufeA7Db+C5fMnb
X-Gm-Gg: AZFdTZcJH90/b6WZ4EyKQGrV2MbGq4O66CjpvQolmZhqmVfbYRmJizZk30b4MJUZCLk
	D+tgD/nGhRTUHaGGamvijPOuPMqtRG9JeCC3e0E+lpFgld/Ib4Fdw7z0jIduglc2+MYWbEYf8Qm
	yMEOo0Bm9oClvyC+gyijQ+S2BMlszYFZxK9qYYyYWrzKJNe5apIgSjj63a2xJxO73WDSH0AHBQi
	attVwyL9GrmpLyX9hIvHgihTKgdGbTvlF19cgy+/zl5mNKKLQyvJi30Hj/14wxaSNKCmuWqqyr1
	R3H1RKx/QMBU7KzbDTFOYTyaZ124CtxE6MBD1+rxydNkqB6U8UhSLImaVPE4Pw7eZcndsXevcLp
	ZbvQWCR85EHyCNzCM+vygreIluY3hk+rQ6joDETnnWeVR1cdjuWFBQBzw6vH19Akv3JAcAZO8cf
	ADSp0iiPrJ0dvMfwP671c1UzJnuQGnLM4htLyIZXzbpx+sAHjhUS35vQRZQjkqwGIx2VBKI6qej
	IRCXWO3aCHq1umdHvlaRvwpu88KsEqzLNEcuQqSDD6Of7SrtQKFzBn+cwiDlEcDPQG8GmlUpbfz
	TeluiQdQGylKSvwLGRvTvHtJiooR/KHU6dre+a2HK5gtMLLNg4QthY/C+9jnAKDHC4ZrbydVyj1
	sX3s2irq1VNuJRs2uEBJ4Fktg9OpUJtnxltsD1BE82v64Zgyf8KAmIbb6onfhDTS44H6FVe3PIi
	cl
X-Received: by 2002:a05:6000:608:b0:493:28c4:331e with SMTP id ffacd0b85a97d-4a63ac6b509mr6786601f8f.28.1795021045786;
        Wed, 18 Nov 2026 08:57:25 -0800 (PST)
Received: from C422HJQPQG-Fractile (cmbg-18-b2-v4wan-168328-cust3701.vm17.cable.virginm.net. [80.5.206.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656b1cfdfsm6052676f8f.47.2026.11.18.08.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:57:25 -0800 (PST)
Date: Wed, 18 Nov 2026 16:57:22 +0000
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: drm: ioctl: fix call to unsafe function
Message-ID: <av3Y8mTaRi7l-5iy@C422HJQPQG-Fractile>
References: <20261118133232.48603-1-vishal.moola@gmail.com>
 <DMYH0CXPUTMP.J3AKN619TL34@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DMYH0CXPUTMP.J3AKN619TL34@kernel.org>

On Wed, Nov 18, 2026 at 05:17:41PM +0100, Danilo Krummrich wrote:
> On Wed Nov 18, 2026 at 2:32 PM CET, Vishal Moola (Fractile) wrote:
> > diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> > index 64af9eacc306..5a2e2f4f0e91 100644
> > --- a/rust/kernel/drm/ioctl.rs
> > +++ b/rust/kernel/drm/ioctl.rs
> > @@ -152,7 +152,7 @@ macro_rules! declare_drm_ioctls {
> >                              // dev/file match the current driver these ioctls are being declared
> >                              // for, and it's not clear how to enforce this within the type system.
> >                              let dev: &$crate::drm::device::Device<_, $crate::drm::Ioctl> =
> > -                                $crate::drm::device::Device::from_raw(raw_dev);
> > +                                unsafe { $crate::drm::device::Device::from_raw(raw_dev) };
> 
> I remember there has been at least one compiler version in the supported range
> that complained when the safety comment isn't directly above the unsafe block.
> Has this been fixed in the meantime?

I'm not sure? I'm compiling with rustc 1.98.1 (48a229cea 2026-09-01) (Fedora 1.98.1-1.fc44)
which gives me no errors like this.

Hopefully the build-bots catch it if there's a specific compiler version
that still dislikes it.

The following command shows a few other occurences in the kernel like this,
so if its still an issue I imagine it'd likely be caught somewhere:

	grep -rn -B1 '^\s*unsafe {' rust/kernel | grep '=$'
