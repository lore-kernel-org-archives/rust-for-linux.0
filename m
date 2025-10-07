Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB9EF9D6
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759821353; cv=none; b=o0wlOC4jnJ3xYvQ2COoURdG10zbvx4phBwhjD5lcDSTwHD5fIJDOvQ0+89+K7hM1eUL8jl2VHSjUURIVF05tCHkWYA7MJcSeo4sQZksDZvpABHtZZG1L5v6Xs+dUjSZ7uwcjCgGGeEIU5DbMa77LNIgjafi8tH0Sd0KUuekhiTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759821353; c=relaxed/simple;
	bh=z9ZXgLsIETBZdYU+Z0pJbtRnOe6ikC0HYb6Bt41W6xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaipeTgiSMKQ8ykO/Rc/U99P25kuo7zFu9RZNWDT6qDJbMm/OfLTPuc08dymFsbUIMOo74wH881EJ92m494SAEkCQsBopnTPmBUqnGS4hq1YEhQuTjgHqXJIFYd6AIC60AqjmogmU+H1qyAqgU/S4iYsmN7d0pPmtXK9+4UK/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D67G2puQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D67G2puQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so29333895e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759821350; x=1760426150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEDZ0FsctXTT25PdUb7+D7imSwt4Fuc+97g/5BQFmmw=;
        b=D67G2puQYF2osXmdG2tRmCyWzVWMYN+Mdmha6i76MnX+jNUgxWGR5ww6T4A3cnJBte
         PUlBWpggd7rtznR8LATM0mVUnCC4qtUVkXHPBGcEPkFi6mJR9A5mcApvuRy9ohg7Vk+K
         WXsLJ7CY7AV8vOKheD/9TNmqoHGZvEY4PVY/TcIYOBX7fpPq4Cfae0QDsMi2pNmkE6cB
         YsSxhaDWkz+UIu5pQT06MopKPqr2AAeU7EtOQT/LdNkHPRpEuFtYlMZDR2ZmO3hV2KL1
         kiunotVw1IWKapRyeqylGn4unDjxTQb5h++LJgDCDvhCkGfn+PVZ3n7M9LbGUWdsbubb
         767Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759821350; x=1760426150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEDZ0FsctXTT25PdUb7+D7imSwt4Fuc+97g/5BQFmmw=;
        b=ZzVaG5A9IYzc+P+Gz/L0kYcXnV8vkN2bes8/nOzjMsyHJpynPyY8FNOcCFTHJ7kotT
         v1EG2ofZvR3QGOhHWSsol4lz1Zbc2x5Zn1qtpfaok+zP4U+BlFMjvGcpefiz7QM7QX/O
         xkOIcQlTYrFsnB22wAsiWjUTwTtWDNl+p6RKfhOE2lsnD6dqTwsvh4nKT9Z4l1F4i+B+
         TDFy5L3e7byrSj4cHVj8ST+M+ZrAf1TptztHpcAA0BlyOYvN6NBoZsk+ceMGjQ5zq7mM
         X1T3JZ5bkOdxbm1mmdPqN7SDGYc4LjBPayOZT56+FrJiu5BJJ47kj9/xOdpzRRPsEX/j
         yGrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd4j9s9w+lyf9/G2GB0uIjgITywyVjO7TfzrYq64xXDQYYGssV1HNsdAoyD/c5iEM6/rq111JzAiZ7wBDrBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24zfkJOI42g+iqNxPvYDnRtYFf28PBKPLyiYoYXP3wYy+cYUr
	CZ4EDWy44k/7NiYgrIMJQRplZVh8tJQyV4mmgqt0rEfhfhw0Y4koA51Omz11EvqlOoZEgLKpyZe
	scLpoRZBXPkAsK6HfYLkCuvR0YYqy2330KXgQ+1+z
X-Gm-Gg: ASbGnct/u+FjQ6e8/gbJ980hWOXo0H1kAa5WLSCt+sguArgj10EKGpyJ1Anu2BMkPdD
	gSjHFtwDD00oqvNvCQW42TuAqp8J1s2T2i+StSIL2zkzfROtWRJf8Y+Cy8MiXT7zjtVhWJyPvbv
	Ug7JgH+tr0ppA61GU+J+OLdvxBHCdYUsmlPPBW3FeQ9UYOtteT3FQrPCaJ9Zh2bTH0aon7y4KIU
	0dpOe3MSMVhL7vvDrmRc/UTkA02ptsBLPDNfGt9Q2NAgnu7vGmhqPluH+OfNXAIbB030UTKbjp1
	dw==
X-Google-Smtp-Source: AGHT+IHN82I6u9PV3m3T4AyeGxqQDcrMtP+2C7gcRrU3bk8X8rWbSiECp23jl+rfoqveFg745pQlgqV3AFCycsCdTp4=
X-Received: by 2002:a05:600c:1f8d:b0:46e:4581:6634 with SMTP id
 5b1f17b1804b1-46e7114684bmr95963215e9.29.1759821350287; Tue, 07 Oct 2025
 00:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
 <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
 <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com>
 <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
 <cd2ea7d4-6b12-4933-b1ae-cd4db18d3671@nvidia.com> <20251007070611.GA88971@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
In-Reply-To: <20251007070611.GA88971@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Oct 2025 09:15:37 +0200
X-Gm-Features: AS18NWAypYnO3FSMvWWPHzph4WyVFTzlcHH5O53Vehnkv-a0YVg6GpPRGHeldOA
Message-ID: <CAH5fLghTu-Zcm9e3Hy07nNtvB_-hRjojAWDoq-hhBYGE7LPEbQ@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Jakub Acs <acsjakub@amazon.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 9:07=E2=80=AFAM Jakub Acs <acsjakub@amazon.de> wrote=
:
>
> On Thu, Oct 02, 2025 at 05:24:48PM -0700, John Hubbard wrote:
> > On 10/2/25 3:43 PM, Andrew Morton wrote:
> > > On Fri, 3 Oct 2025 00:39:16 +0200 Miguel Ojeda <miguel.ojeda.sandonis=
@gmail.com> wrote:
> > >> On Fri, Oct 3, 2025 at 12:27=E2=80=AFAM Andrew Morton <akpm@linux-fo=
undation.org> wrote:
> > ...
> > > From: Andrew Morton <akpm@linux-foundation.org>
> > > Subject: mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise-fix
> > > Date: Thu Oct  2 03:37:47 PM PDT 2025
> > >
> > > Rust bindgen wasn't able to handle the BIT() macro.  Add a helper (fr=
om
> > > Miguel) to fix this.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202510030449.VfSaAjvd-l=
kp@intel.com/
> > > Cc: Axel Rasmussen <axelrasmussen@google.com>
> > > Cc: Chengming Zhou <chengming.zhou@linux.dev>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Jakub Acs <acsjakub@amazon.de>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: SeongJae Park <sj@kernel.org>
> > > Cc: Xu Xin <xu.xin16@zte.com.cn>
> > > Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> > > Cc: Alice Ryhl <aliceryhl@google.com>
> > > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > > ---
> > >
> > >  rust/bindings/bindings_helper.h |    1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > --- a/rust/bindings/bindings_helper.h~mm-ksm-fix-flag-dropping-behavi=
or-in-ksm_madvise-fix
> > > +++ a/rust/bindings/bindings_helper.h
> > > @@ -99,3 +99,4 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRE
> > >
> > >  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
> > >  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> > > +const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
> > > _
> >
> > Yes, this fixes the build on my system too, so:
> >
> > Tested-by: John Hubbard <jhubbard@nvidia.com>
> >
> > ...of course, we'll have to undo this later, as part of the fix
> > for the Rust for Linux build system, to handle BIT() and similar
> > macros in bindgen.
> >
>
> Hi,
>
> sorry for the issues this has caused. We're also changing the other
> defines to BIT() for consistency, it was applied to mm-new in [1]. I
> assume this will have the same breaking effect. Not sure what is the
> solution - whether to wait for the fix mentioned by John or add similar
> defintions to a/rust/bindings/bindings_helper.h for all consts?
>
> [1]: https://lore.kernel.org/all/20251002202112.C2293C4CEF4@smtp.kernel.o=
rg/

You have two options: either add all of the constants to
bindings_helper.h, or use an enum similar to commit 3634783be125
("binder: use enum for binder ioctls").

Regarding John's mention, don't expect that for a while. It requires
support in bindgen, which is shipped by your distribution, not Linux.
Therefore, it takes time for improvements to become available to
everyone.

Alice
