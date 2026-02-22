Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA47D3EBF3E
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 22:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771798159; cv=none; b=pAzWGHxZxkxLTbnXhUI5KYyVcQHcrit3AZFOTUdmMq81LrBHYV1hCfqoElvh37bwMsroiNYDGf15BqppCnen1js6CdxUDSzwy7z8kBSMMLSg1+8skFzwlGGgDfQa2kJxJSPd8D/sbvSEYvu3ofeYPGUChb2rlCYYnpFN2+q5TzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771798159; c=relaxed/simple;
	bh=gg2PGH5N2PSMcSrIj+okaGRyO9G+QKZikbs5CPWZtd4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gw/HrEC1hNaz/65S0lIaAzkcHUClpYzhCsTr8qf7k0nbZH8mXPNKb0wwCUTOhlh2cMgei4S7Mds8DhvlhRLqF2d3LMh3PLlSLBuMngz1Ba/hpUa3nAbt/6Nlo06TQHvMLJfVp+48aHFEuXIEoB45FR9q9C3ud6NNaAED/26lUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RjscmW0c; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RjscmW0c"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65807298140so5592148a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 14:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771798156; x=1772402956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0ux4ZEvZJ4hcsLckkohrc2GXPqcYNCw8BHTj7ezbd7U=;
        b=RjscmW0cWvfYjyqZbEPV6igcncbpXxQx7v0HunRA3/pXYmKvSlVs51SyT5jjq0cxPz
         AfLvWtXtLy0Yuc21qQciwUIUQBj2DIlEVB9LrB7cIpXjWyaOHviI4fEV2y2Onj9RHPoJ
         L3txiki1J8yQck3sjZGrtpIF2EEni1DJ3KazI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771798156; x=1772402956;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ux4ZEvZJ4hcsLckkohrc2GXPqcYNCw8BHTj7ezbd7U=;
        b=W/foKwl/eVlyPEfEooEbi3KnY1qheZNzNSyxt9+WonoWoegTv3xw/1DzD4DLHbi2P4
         mlERcVeRW7C6GNfCBgWem9Zpl4oKkzwP5sXWFeA8v/XLLdCxnoru2wyLZzFMGNfKIjTV
         P1qVMZNH18/MkxWOajHdqvRHCJh/loz6pBRA5TeyIZnkWgVDUoWep9SnwZ5mNRnh6Nn1
         Gvwv0Kmjhm8PO8fQD55FMpqe/aJqgr6aWioWD3nKCJXdVkslOcEpJKObgpnqyn0WBN3q
         JKxDYvfX5qb6zru4kRyOUca7squM/Ua3vRS/X6sRUiuHxPETOLm+zH4/qa+/1xBX0Klf
         oObw==
X-Gm-Message-State: AOJu0Yzf1utGD6YLnR5NTA1AtpWXg839lmOVTJAo1w03Q1T8TSEjqa9A
	GvconaDK2FK2ruAUAmMLU3G8NbzggGydWC+Q6Ijwj347ffcSLSNBcQsVasJQsh3y/j5HfOYe5LQ
	gNY5W4WE=
X-Gm-Gg: AZuq6aJgSivAg+WJAtnSn0Gto3iDJVRHhABtFrvN+fpEQVj8Crh4swx7BnGzRDgzKYR
	SmL1qJ9iR+R5298G3o2/xP+iVTok+D3bl9MZA+TKdPxiAOer/WbnruNUXsz58j9brSwJ6zzhkwi
	qIhP/pvKSONiPytmNTwd6dN7Y3fZ4MEWlA5uOAD0OgLTKhqY71lJLySZ3oCREC+/hCo0DTTXl0D
	5UnR3V6a1yDZk4iLXrByPrxnfd1jyW3x7Vxip2zXNBpmGfuV4DQYr+yBi5m5arvwn2OOBE63zMV
	jxF1z8nSnegjPBRTTJVNXj6+GJ6CSdh2H54fZusgFQ0TOtmiqkfaHjVNNLOIs9Lz4os+OUwui/b
	CPKmhpfEe60YAtd6+h8dWnEf4Dli0knbNL2Fe6O/Ok1C2OKb3/hZhfmDFDuSK3i/RZcNuYgqN39
	EglD3YwmwyV8VQdWInGrgYEL/KB0c8A+RYo4g5oZpuV+e7u5xeBAgrfB9RPs1Q/CFQrbQ57dTo
X-Received: by 2002:a05:6402:f25:b0:65a:3cd4:8c9b with SMTP id 4fb4d7f45d1cf-65ea4ed1a45mr3682655a12.11.1771798155969;
        Sun, 22 Feb 2026 14:09:15 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eaba4225dsm2021221a12.33.2026.02.22.14.09.15
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 14:09:15 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65c0d2f5fe1so6247505a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 14:09:15 -0800 (PST)
X-Received: by 2002:a17:907:1c18:b0:b8f:6699:a036 with SMTP id
 a640c23a62f3a-b9081a2bfa6mr362521766b.19.1771798155202; Sun, 22 Feb 2026
 14:09:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Feb 2026 14:08:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgz_YNXErcC7FSr5kKAONTZC=SKLsbu6gFN1hCEE5JsKg@mail.gmail.com>
X-Gm-Features: AaiRm51pe-pZJq1a42X16T9P_h744eGU2QVVjHutBMEgrO5wd9RpWJw7MNOYKjI
Message-ID: <CAHk-=wgz_YNXErcC7FSr5kKAONTZC=SKLsbu6gFN1hCEE5JsKg@mail.gmail.com>
Subject: Rust build speed-ups - please?
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

So this is not new - in fact I think it goes back to the original Rust
code merge, but it's been grating on me for a while, and it *really*
ended up annoying me this merge window.

IOW, I wish somebody would look  into it. I just don't know if it's a
Rust person or a Kbuild person (or both) that should do so.

So I'm just cc'ing everybody in the hope that somebody will step up.

Anyway, the annoyance is the initial part of the build, which is
pretty much entirely single-threaded, and as a result takes a
relatively long time for many simple builds which just shouldn't take
that long.

I haven't looked into it very much, but I'm pretty sure it's all due
to this in our main Makefile:

  # All the preparing..
  prepare: prepare0
  ifdef CONFIG_RUST
      +$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
      $(Q)$(MAKE) $(build)=rust
  endif

and that just means that the real meat of the kernel build is all
gated on that annoying initial rust infrastructure build.

Here's a test-case that I wish people would look at:

    git clean -dqfx
    make allmodconfig
    time make init/main.o

because for me it takes OVER ONE MINUTE !!! to just build that single
object file due to all the excessive prep stuff.

Or - after doing the above - do something like this (imagine I've done
a big merge, and want to compile-test the *one* file that had
conflicts in it):

    touch rust/kernel/faux.rs
    make init/main.o

and notice how that empty build that doesn't even build 'main.o'
(because it's all up-to-date!) takes 5+ seconds just because the
kernel build insists on updating those entirely irrlevant rust files
that have nothing to do with what I asked it to build?

Yes, yes, those are artificial examples, but they are examples based
on real issues: me wanting to do build checks on certain files, and
then being held up by entirely pointless other builds that shouldn't
be in the way.

Now, we have other annoying prep in there too - I absolutely hate the
HDRINST phase, and it would be lovely if that would be fixed as well -
but the rust part is the one that triggers most easily by small
changes elsewhere (iow - those "test-build during merge conflict
resolution" kind of situations), and really stands out like a sore
thumb in what fro me are normal circumstances.

Can somebody who knows the rust build requirements better please move
all of that into proper build *dependencies*, so that 'make' can just
do it all in parallel with other things - or not do it at all when
they aren't required - that don't actually require the generated rust
headers etc?

Yes, the actual "check that rust is available" part makes sense as a
prepare phase. The rest? Not so much. Why the heck does it build that
'rust/core.o' file when I want to do a test-build of a totally
unrelated file?

          Linus
