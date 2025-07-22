Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5920D50B
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187530; cv=none; b=qP5DoPD5eXvX4QNwGCXaeq0qwH812fICCMQkDxTMPh1WpoBqWQE3/0DQJO2PtwOhb5kzKCx0mgitchcui3FbyPFwoYwVhncas8i7lUjTn6VIett0oACWLDkmdx9inDhrt2NW92GhGg40NZHZllA38A3B82r1U57Z7pjI11+Kgf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187530; c=relaxed/simple;
	bh=7PwwaRajLOvv7X0WuJ14cocQ9yDQ8UMwXR/w6BZUyaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvMHVMFxn03hzt624+Iajclu3u9U1ESXPBP2N3Ctyh1VsWB+y36w+oA2KbNHaXnJoVk8wCnsPZ7VdqSu//fZKyGvw2mbWkAh2re3/d5O8y+zfFVafxBvAogfuHKYwUjAsLh1hGRFI2+NptjxjPv+Z5vMKJ1I4j5dvjdLyr+kZoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mvhugs+p; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvhugs+p"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31306794b30so141301a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187528; x=1753792328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLhr1SDWltefq4XdcMQ4uk+FftNyOSPYEQNapEqOR+k=;
        b=Mvhugs+pHBt241kr7uH3Q6NvxaKpdZvY188KFIkKP1rbODxxvz0Yu/R6H2RHgo3xs4
         V/zUCroOrJ6n0stD3t3f0VauwVHE3zbYxobxnoUoXyzPEyuopjnkQHJcZhjSFlVLy21E
         tb3YBjRcipwBdmsxmTCZIOGBoMK2AqB3ZmMSB6fLBxRY+x76IYqBO2pLl9Y5xC4sDumi
         i1gbQRH2MU/p2Bl86Gjve49iZFhaV516JKujFWmaASsuBLbHBbsMmkoxw1n9N+v9/wSl
         31Zd84m3Pvv61iotZWBJ2soJOwbtVG2F0ciOC/VffNwgQbeS46G4Rcu9f248tPQlpPIS
         rtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187528; x=1753792328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLhr1SDWltefq4XdcMQ4uk+FftNyOSPYEQNapEqOR+k=;
        b=Qvaj5fV7HHRcngz5p9f/lrRbWFVtzgRywi54lOiVDCbEAZysKZlJKYbYfP2vyuXbQL
         jatFGcxxll7VXvDGMksWCT3x5vBvD+9sTV98NVK13YPs1S3wdlhGCHoL2QtKxEV2T8IO
         cUVsX5S9p45sDFTcMMEeuTfWsez+U8pCL6dFO2jucgxZWQfexKiC/1armv8LBV1EpfGr
         rrBBID5k5Dz9xNq/Acz2KLfYQvhBr/YES+wrwCyHhP8nA5f5L5GVm7Mn6ltiRcvrR6LE
         +056Xj9Y4/lahmcHJoglYhji4hYy7NGPX/bntE+dbmRexj24naIy4UwmFY+I5AG7ng9v
         pyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxdyRdvit6Rnc3QQ8C6I8pPs/ba1DsCYUuDc94MJp/PJskWDM/7Qp/wEqFzyaCX+fEDTgrtMWnFtPbRSs6CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfPKXXW6QZggulM5Ia4+x7mLskZClZE8L3g1ilKdV09ROJXjQW
	sC6yCtIYkLiE/TOvo1w7oagpoeKY87pSC/l4dAFcQ4N2PrakaYg5uTcH+etsgZhB0zz9v4e2JJC
	gqlRVr9pRSoZ+j50t1v1uAhWg/f6Snmo=
X-Gm-Gg: ASbGncsVylxgB/pL2RiY1TA0e6FOwJ1ZIgVEJNJpTiMGiIph9UV1O2cDtn1dpSblW51
	eG07qoN79w756CC5U6Bx7gwwSwWhKqkp17nW7ZNm/B3HYoBOeWwYZXbiBxTc2FU5m/3Y/5svC2x
	nRB5nlTEKEu5FTf++N14SGznsvYhPakGNfbPyOSUFsqOfx4zkxoRYmdiwDW7mNqvVsfFoMm9SrF
	Afo6MOb
X-Google-Smtp-Source: AGHT+IGWNJ0mkWRTh85U7RqM6tPgV8tFZokSbZw+7BKB101NJ7exNGbOxTAJTLICJ91v8JLwUuz/WzcivHWYtOS/N3g=
X-Received: by 2002:a17:90b:3f8d:b0:312:e76f:520f with SMTP id
 98e67ed59e1d1-31c9e79d7c3mr15206360a91.8.1753187527796; Tue, 22 Jul 2025
 05:32:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716045957.39732-1-ritvikfoss@gmail.com> <CANiq72=C=VHGXFvGuSY7rnNOvW-2yAA_g5yQamVN-mG9btwMkg@mail.gmail.com>
 <aH-AXKaEqcN2Wuzg@fedora>
In-Reply-To: <aH-AXKaEqcN2Wuzg@fedora>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 22 Jul 2025 14:31:55 +0200
X-Gm-Features: Ac12FXx-WwqL10rZ0s_9rOg-EWL9l7VwXPyGSTJG34agmDBMtAPtEyyTjrOYXcY
Message-ID: <CANiq72kQGjWedd-tbQd-tLoXMofHs2VF0+A_qcZjXFi3GwWj9A@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: introduce `unsafe_precondition_assert!` macro
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 2:12=E2=80=AFPM Ritvik Gupta <ritvikfoss@gmail.com>=
 wrote:
>
> the caller should be able to call this way?
>
> ```
>         // Allowed
>     unsafe_precondition_assert!(condition, "message");
>     unsafe_precondition_assert!(condition, "formatted message: {} {} {}",=
 arg1, arg2, argn);
>
>         // Not allowed?
>     unsafe_precondition_assert!(condition)
> ```

I think allowing the second one would align it with other macros,
which is an advantage, and makes it a bit simpler to use for obvious
cases.

On the other hand, `assert_unsafe_precondition!` upstream doesn't
allow it (but it has different syntax anyway), and we may want to
always have a proper message in these cases anyway.

So I think either way is OK. I would perhaps lean to being consistent
with our other assertion macros, especially if it makes it simpler.

Thanks!

Cheers,
Miguel
