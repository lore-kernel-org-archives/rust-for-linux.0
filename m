Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAA36C59B
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339533; cv=pass; b=WDaLy5WHV6DfPHRP0l0EDD3jvnFpzCSyHfaPaO91T/0ACvf2G7oJZAzrEfM1MirPRtgHmQjxsURbo7SOOsXURsAnX0bK2UqJ8+hNJE765phcFiHOMn+d1eccYnMbttphHPPU4a3+7PrDXRHJ+RykfGePPG26KVUHsyVdHN+3g10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339533; c=relaxed/simple;
	bh=uaR/u5cPyvybzSm+F1oAa8EEy5fmYlTMTQecV0B+GhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASh5js7gx3B47JgjXsmyFcYUjfyDopVunxV8klfuCNk7Ht4RolNxkiOwshxRE0SlVF2W5zpfvR72sKK7zl8Pqr/Yuo0TTtymMajheIwzCkDSrQwtLthAzp2eTdpuCCfXDElkgs9bazkGNzR1h11YUvQQs1tmoOr6C5Dknmuyrps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fleImMQY; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fleImMQY"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3870df2331aso55487651fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 06:45:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771339530; cv=none;
        d=google.com; s=arc-20240605;
        b=G6Q4yT5fwPSmG1UjhGZ1WTDiJs15h/O4ky6fRttT60Q1ijJ3tXFpBRZucx5HbULHnz
         KWmXBWJV6zuPVWJkK/k82i+K6ohIgitQb0wS7YQIKSgJj1IASQnpuJbF7McjBW5sW/q1
         T3om/uDF2zt10d3B1VvHHhO0E7h175XNA8f/h+v+PXTrzJftzeRAQsf+7hIJKGr+vG8M
         t5fESbuvy86DBHMCVWHjETT6o2YhzEinrz4E67LHJq3tXJWtf2F6N/1cDmOU/6vqu1VJ
         Cxqi2iOUIzHYHCZcp+Arqp+QycDeo8+g0B0LlgX7yHmI7fc4XAC2Eh+Beilap49BXN5a
         b1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/u7uZc7jD35zWuHRH3TBmkuy1kyuGW6IWcfflu/14kA=;
        fh=5ZtB4YgX5758eBJG6uk6VbM7ZBJfbA7gGP4BQBa3UEQ=;
        b=DSkCATMqYazNaJQYaLbtYQDPZRImGqFOnx6iKOHqvJxBwX5PTXiK9jt8zQjinkMyTa
         EYx/qYhg399pCeWFdxcfHUu0iQRiKs7/HHR0gCbOpLJRJhM8ERDJL40yZR3VbLKo5o6j
         RLUGFk6v+03GpqElmBra5Pv/ZZMfUCaHJzC4D2QEd4jB+NCOyo/29uAirtokoJu4cIVL
         JEK/1s3f6IvYH2yEuh3smABtRtmoNfHHtT+51jYeOSIc4qUF6EEk5ZM6VpkjUE7cN3SY
         8SAOUpnwLL4X2+Mec/CQ78FnBIdcL3XVYWMdZA/Spnb3tNdCbdBpEMN5OGY4KGG6SDcx
         ljAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771339530; x=1771944330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/u7uZc7jD35zWuHRH3TBmkuy1kyuGW6IWcfflu/14kA=;
        b=fleImMQYRuT1jw7UDMOy+dlHnmIiOQ9WcsCCq4ASuLYNsv1WMir+73lUWhvNQpQqDV
         10HU558yd2tmXmi8On3dGFsompaxMIasGNS//Gec2UHHQ4fDzt2LqctzQynRs89aqyMB
         2NqKPWRL4uBckXUfBn8ku6YBWaRZ+F8DFq+UsTivgtytdVZVO+Na1pGfkeQpPhERG1u9
         lZa+WJPvJFvFela8lu3W5MoeQJpECLfSXjEcpFg+cACCSIdmB8NQNf9WjekKN2/HHlGH
         89MHN9SzoWcCzs0WDFluV6hYSqm3+LgE2yRUxKe7fT8qiVLuL3GbVpE+XYuHGFKnMKEu
         EhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339530; x=1771944330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/u7uZc7jD35zWuHRH3TBmkuy1kyuGW6IWcfflu/14kA=;
        b=pNPVrtasoL7ponmxGfRplR/+eU7eYNvgBc4FmOI+XfQdZAi5XZNspJPISwCR4a9ArD
         my8wOqm9Y4K7SrL6g7x6bA6FNu5Ua9BbJ3heF1yTQVv1nLPLbBinBWDYT+7fWCgPShgf
         eAQ3+9XohEkYcOnr9770ieyKDFhIOoYOLg02DH0dXPNxCI0Fn02HzKRRnEQcmfwbj1eA
         XBF6mq3POBZLV72NU/Pz/cNjrjZZl3s1MafdA6yqHdgsBdTWd4SyfRjJL1pxpjnu5TEB
         lzTUUTA3TosP0u2TmG8JYyoDZZruMWw7ZX31Tn7xBzKYDkpf+49f0E+EuCKQP2pRLkCq
         Hkvw==
X-Forwarded-Encrypted: i=1; AJvYcCU1iPD4iXMi1xXd0EjLO1wCUzDSSpXPUO2XtgmpsSCVvQBwF4NAVl5Em/CtfgNDY8nA41ribADEDK3o7nGMwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxrDKSxkOjE08wcdOa3HX1PR0D2duHKYXRc30X6gRS4IutQ5cC
	QfXCjYR7c7FXI4z7INNF/oZWMAHdld6cJPZ89vFtlau/ft4Qsoi8m54lhgDqC/Yd6NJLbU+/AEX
	V18JEPA0RoSACF5L0jkIxFgZk+JofSTs=
X-Gm-Gg: AZuq6aLuviaq+Ww1E9fBYL/y/jrvghKiYYeNN2RuDFJUYVQk4LX4eDzZBPuPTEk8qUk
	a1K9vwoPsu8JjEYg0YrEitwfc1Y5eXbGENFtLQIZidFRftua0Ivc7pgaPrC85zjEkDOx8+rWgUL
	ETYXfoIOdGA8kVRz9ScbYgUrW/VGwgkkmSbrbtyPlFOdZBwzsguqvO8esZIILrNTMvEnMDf7zo+
	E78r1lM3X4q2Zk6TT1adXqO1A1tktubFfUZGyaZnTPOkYl1lT9cm7L3kVeSpqeJF0yyD5ddJ5GW
	bNZPA+naS5Bw2micViSzrPwZcRjeg7j3yExwxQylEGT/7AaxnWs1gQo+Nigt5jgeENtr3GoKA8x
	qlQ+wI4kOKyeSALuo6A==
X-Received: by 2002:a2e:b8c4:0:b0:382:4fcd:66a3 with SMTP id
 38308e7fff4ca-38819d32634mr36440621fa.12.1771339529478; Tue, 17 Feb 2026
 06:45:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZRncP-sKLLS2K1U@macos>
In-Reply-To: <aZRncP-sKLLS2K1U@macos>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 17 Feb 2026 09:44:53 -0500
X-Gm-Features: AaiRm52IVgk0DHKj7FtzDxuM09qZBpdtFqiGf_Kkv53QRe7PSQMWUtp5YOtQLb4
Message-ID: <CAJ-ks9mhOAgNKjepUOS918q90JkmyqVU6axKt-v35Rav+MNy3w@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Evaluating Rust for XArray
To: Daniel Gomez <da.gomez@kernel.org>
Cc: linux-mm@kvack.org, lsf-pc@lists.linux-foundation.org, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Daniel Gomez <da.gomez@samsung.com>, gost.dev@samsung.com, 
	Greg KH <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@inria.fr>, 
	Kairui Song <kasong@tencent.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 9:28=E2=80=AFAM Daniel Gomez <da.gomez@kernel.org> =
wrote:
>
> We propose a topic to discuss the potential use of Rust in core Linux
> kernel data structures.
>
> The XArray unified the kernel's radix trees into one API back in v4.20
> (2018). It sits under the page cache, block layer, filesystems, GPU
> drivers, and dozens of other subsystems.
>
> We looked at XArray bugs since 2018. About half are the usual suspects:
> races, resource leaks, encoding and overflow mistakes. The kind of bugs
> Greg says make up 60-80% of kernel security bugs [1]. Most of the rest
> are complex logic bugs where Rust's type system may help but cannot
> eliminate entirely.
>
> The motivation for our interest in evaluating Rust for use in the XArray
> started with a bug in mm/filemap.c that corrupted page cache data [2].
> Consumer code called xa_get_order() without the lock, the tree changed,
> and pages from wrong files ended up in the cache. No CVE was assigned
> to this issue*, and no reproducer outside production existed before the
> fix (a synthetic reproducer was only created [5][6] after the issue was
> escalated). Kairui Song's refactoring and optimization patches [7][8][9]
> happened to eliminate the issue.
>
> In Rust, xa_get_order() would be a method on the lock guard. XArray
> users would not be able to call it without holding the lock because
> the type system would not let them. That does not help with the complex
> logic bugs, but it eliminates the class of mistakes where the API is
> used outside its required context.

These benefits are compelling, but they materialize when the _caller_
uses Rust (and when Rust abstractions exist, whether native or
wrappers around C). A stronger case for a Rust implementation would be
justified by internal complexity; IIUC that was the motivation behind
Rust Binder.

> We have a Rust XArray prototype that implements core operations designed
> around Rust's ownership model. By the conference we aim to benchmark
> it against tools/testing/radix-tree/ and use it to back the Rust null
> block driver for A/B testing performance against the C implementation.
> In the longer term, we plan to deploy the Rust implementation in the
> page cache for A/B testing performance of generic workloads. We invite
> the community to take a look at the code (when published), which at the
> moment is rather simple as it only covers the core operations.
>
> We know that Rust is not magic. The first kernel Rust CVE was a race
> in an unsafe block where the safety comment was wrong [10]. However, we
> believe that constraining potential memory safety issues to small unsafe
> blocks provides a significant advantage over writing in C, where the
> entire program text is to be considered one big unsafe block.
>
> With Rust now part of the kernel's core infrastructure [11], we would
> like to explore whether Rust is applicable for use in core MM data
> structures. We invite the community to this exploration and we would
> like to start the discussion. Specifically, we seek insights into:
>
>  - Which workloads set the performance bar?
>  - Would a type-safe API reduce consumer bugs, or would they just move
> elsewhere?
>  - Would rewriting core data structures introduce new, previously
> unseen, bugs**?
>
> *Under the Linux kernel CNA's CVE assignment policy, data corruption
> issues do not meet the cve.org definition of a vulnerability and are
> therefore not eligible for CVE assignment [3][4].
>
> **Our thought: The existing test suite covers years of real edge cases.
> A second implementation running against it is not just a rewrite, it is
> differential testing.

The downside to a second implementation is that it acts as a change
detector: If the tests run against both implementations (and we can't
drop the C implementation since Rust is not yet required to build the
kernel), any change to the C implementation must be accompanied by a
change to the Rust implementation. I'd be surprised if the C folks
would be pleased by this.

>
> Link: https://osskorea2025.sched.com/event/296sD/keynote-rust-in-the-linu=
x-kernel-why-greg-kroah-hartman-linux-kernel-maintainer-and-fellow-the-linu=
x-foundation [1]
> Link: https://lore.kernel.org/all/A5A976CB-DB57-4513-A700-656580488AB6@fl=
yingcircus.io [2]
> Link: https://www.cve.org/ResourcesSupport/Glossary#glossaryVulnerability=
 [3]
> Link: http://www.kroah.com/log/blog/2026/02/16/linux-cve-assignment-proce=
ss [4]
> Link: https://lore.kernel.org/all/d4a1cca4-96b8-4692-81f0-81c512f55ccf@me=
ta.com [5]
> Link: https://lore.kernel.org/all/5bee194c-9cd3-47e7-919b-9f352441f855@ke=
rnel.dk [6]
> Link: https://git.kernel.org/torvalds/c/de60fd8ddeda2 [7]
> Link: https://git.kernel.org/torvalds/c/a4864671ca0bf [8]
> Link: https://git.kernel.org/torvalds/c/6758c1128ceb4 [9]
> Link: https://lore.kernel.org/all/2025121614-CVE-2025-68260-558d@gregkh [=
10]
> Link: https://lore.kernel.org/all/20251213000042.23072-1-ojeda@kernel.org=
 [11]
