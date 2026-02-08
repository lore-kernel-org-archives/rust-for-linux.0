Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA2C2BD59C
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Feb 2026 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548650; cv=pass; b=A1nOCgGswjfOC3TtVXLfJOO9ochYmqQOOmoGRBV8rMYsEqdI9EfXW5lS8axGZlW9EsBpL4uun8oIlbPnji54chAJlke3LYXZGUrDRE+xtsBNo9kMZfDVzLHKpbfJaNNFHhPgWhKQtp5s1LKkGexyUPsbK97FibWDcpH0PWuHmFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548650; c=relaxed/simple;
	bh=CsNWPa8nRGpboGQ5lGfmNf4LauhVBQGyeKOsESLX8uY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0EzcbQmXUOLoQOA1vEeGsH2djtHssrpXmHj8hi/vOafHaqWAIwYav2Xs5TwvJHWBUIShunpQ1+le8Oq1WIIt+zRsbrJIDMUVFvLMOrRI6/WviCCeFFe1/JJi/Q2abNw+fuSl/jO6HjZ08yxlwaJhx8pJ5nlRVU3v6AS69SELR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxiBwl43; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxiBwl43"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ba6737fafbso16054eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Feb 2026 03:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770548649; cv=none;
        d=google.com; s=arc-20240605;
        b=foosMBbIKz0bm3+VlC/vFJNVEdr5poy8ZVQ54WN6kpUBK+ty27YdTqrvu4NGyDvn8B
         gFgnIz0IAel7cgATJ+87ddfll4SYMjedqYZARsNqOoyk+5QQb5l9LIfVLVFPafcJSbco
         K/eJa49961xut4kI9asVDHAzpzKRHC2YJCbckEG18MjTuzWSaAkCJq0G0oiVbOm9Y5Cl
         zv6W7N/MKqTX870IM3KwpyvVIGdoLbXUgl1+pxV3pG4UzcNVCWXfsD1WuXekDD9xUrjW
         xdJDr/e8bN43/r8TQAcaQq9LPJeTKocns1dgv+VVhuD02LshXZ6zN20hczfNG7qZMTOe
         +VMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CsNWPa8nRGpboGQ5lGfmNf4LauhVBQGyeKOsESLX8uY=;
        fh=el1ou1GCi1Chn/vd4JHtrjexN2Dd7G9JuDGA7ETTpWI=;
        b=b5npV1csJJcYf4tHpS3mo13+RZX1kc9T9kssOF7IiKNzV0am3WTqrLIow/F2sA2kNl
         RMZJLwJsW1LwSEc6fDxc1s7uN62No80y97D0sNCpllkVtJhDF6HqF/6rmWPJpx81v6A1
         LHt1GV+Y8FTZp/f9LuvxAr7yrbcOioyhVVoDeLgxXTpScjti6NbgzLS8FBxK+9RKzEW3
         SgWEbtTfSQGuyOPkYZcJcHpCbaNFoUaSHyY+BpWNOMzqFUJasoCuYU2DFzpLs2f09eOu
         ZGp8Qg6SrOMZqLTJG69ajt34oUq8uUTSgkfRXp0XNDn6Yrm81Rs5Ij5E4kOQTGfTB3lB
         gFaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770548649; x=1771153449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsNWPa8nRGpboGQ5lGfmNf4LauhVBQGyeKOsESLX8uY=;
        b=CxiBwl43vYWh1Iy4jF482fZhT/7NgLPHS6Wec9LU+OmS4C54ozZVScHh4n07XTDNVg
         1oFCOemnOZhEUiAw+3LVnxmBDa4Q4hAs6Bacsb8t4ihO0Yq5N1VAJsFO6Y2lvA2lkw60
         7yQPL8q+QK7f8eb0KD/dIctC2mzXhb734kHsBng+CR3K9EuzUp+pwONlJLdvqSnzsrr/
         ken+FekfO5lHJduNsHClbnaqHdme9d1J0Tjj5VRSylEJrW75iPnxfogNwkIE0NyF6toZ
         zUbA5S6BtkcJKwb9BGRSAwKGTUWWtWtYU0uDdwme/rOVUUDYOgrsCcoxsWRy9j5/rolP
         LibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770548649; x=1771153449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CsNWPa8nRGpboGQ5lGfmNf4LauhVBQGyeKOsESLX8uY=;
        b=kSEqjKLZirKOT+6svNltza+DGjnHZzwLJBlVf9ysUY9UHt5IwvTaeWAMy//wOD+C5Q
         F3/xVRfkXsRr0ANwHGW/7zrBuFq4l6VQsVkVxV7dhf9jZoFeA065aDyeGeYreZxBS+qS
         YyNGby9zdFtTgLYt4t2VdqypKdnEyyU+H/Zi/+JtSYnjeSuQKexJO0G2cFcfN0xTR9Ja
         8elmprQeiuH9bNCwFtuqoCRXLkJhDT0BxilzaVzQNYqH99mRVd79spddqlwPbxNd0zVL
         +jIIVD6mApcity8N3jQD4HTrNk1PetRPTtlcqjNUJvVFjmJkA+kHIJflYM2oXwaugA2J
         HS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5nCKra4nlxZG3CNaGPDjA+yHT8YW89XdVxPt7kefkGcruxqgQgVhEbk8xc/ENy250DejQWIvlbmpDuFJNNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVNmEQzrL8zgLGUXGLLpphbnwcos2rA0PNVuJUtEuVygptovXf
	58AtrfXcSgOLKfFU4OvnUuz9oVG3pxV3nLcJdfSZpdFVcCsYnSkayz2BKGUJRSP7/gDbMRvMjjb
	0i9IbhKWNgJjMnCstkECgRUpmud/APM4=
X-Gm-Gg: AZuq6aKrFo1sKmDYTK6HEJ/r8EdQM6YBWLX8v+7RTCCywz2VQwDO+21jWCcTsDqOb5R
	+Ff8tJkbqd6tH0qnVPvN6YMycL1azowTVcnIkeF6mI12i2qdIraTZQDNBaZ6wP9iPdwH09Nk6v8
	faeI8x6WOaDGdUXMI+18QF7/dOiYtZcPeCi/sfipurDtASggKo2T5RBxS/GBNo7n77d8f02V8AF
	+GZCSD1/t7SRRsgAe7Ml5ECFRS9D36I8LZvNLlD1siheyzg8XRobbvnxdx1tO1PEzm1bMP5604F
	8+1cUV4ZkAELXm/e+05VQzdNQDVuLnCNMGplXOd70uZrV13ipp3kMpdqPkeVnsBc4A8wbMUXe6c
	QqG5TffJowwHd
X-Received: by 2002:a05:7301:2b87:b0:2b7:f145:a98 with SMTP id
 5a478bee46e88-2b8563eb1c9mr1959257eec.2.1770548649242; Sun, 08 Feb 2026
 03:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207144356.3063613-1-gary@kernel.org> <CANiq72mhhSKV=CecnZnqhKrt9tpGdMu1hePJtGDgRiD4JG902A@mail.gmail.com>
 <DG8VP6BH1MPV.13AHBBEMZHOF4@garyguo.net> <20260207220543.GA1670883@ax162> <DG93P7TMCWCH.3ACJU31B2HELW@garyguo.net>
In-Reply-To: <DG93P7TMCWCH.3ACJU31B2HELW@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Feb 2026 12:03:55 +0100
X-Gm-Features: AZwV_QiGAqvY777lSs0t_vpiNfu3S-LU0xFEazl0B1d7VPzfby1MCczbD-EY7Zw
Message-ID: <CANiq72nwU7C9+atAXoyKbVjM=4coMjxMSLD8YmECUVuw6Jp=_w@mail.gmail.com>
Subject: Re: [PATCH] rust: build: remap path to avoid absolute path
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, Asahi Lina <lina+kernel@asahilina.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 7, 2026 at 11:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Unfortunately, using remap-path-scope does not give the expected result i=
n older
> Rust compiler versions, so the issue reports that I linked will not be re=
solved
> with it. It looks like remap-path-scope is working as intended only since
> https://github.com/rust-lang/rust/pull/149709, so Rust 1.94+ (I haven't
> double-checked the exact Rust version, but in latest nightly Rust, the re=
map is
> working as intended).

Linked the stabilization and noted the fix 1.94 PR that we likely need
and this thread in the `-Zremap-path-scope` entry in
https://github.com/Rust-for-Linux/linux/issues/2.

And since it is now stabilized, moved to
https://github.com/Rust-for-Linux/linux/issues/1223, which I just had
to create due to GitHub's 64k limit on issue text...

Cheers,
Miguel
