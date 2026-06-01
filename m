Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9DD274FE3
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 06:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295457; cv=pass; b=MJqftAbPXM28S7IEjfSVZ/G03qZUOEa9ahd0PfKIDAZFwj93Qsc/eFF+JpE0IbwmRhOl+PisVQG9KDlxBzjdjrzAUpA8K2eAdt7sf8zR5/mD5tCPN6x9LQA7XWD4zV20G+XcNyytjVtzx4QWiRhMe/qphgcqyiiqEiwNKopUBWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295457; c=relaxed/simple;
	bh=R1yhEG4MKoXjJ4bO08OeDXprdSO1fiP+peqcjquLtrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JH5yZTCFDeeMU1VhdGP+0hz7gLYD/aW/vGk08Q5dNRNjduhYVoEpH5OWYCgTbrfFdpKPJKZo96UgMFWYWV4jopanToSPVSu3gK0g7lPY9dveyKU6GxJdGik5Nl2H2OIQga/F31VpoP2eR84Bg4YsSpIJBteBnEmBYcVr9ENeKtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TewebJpN; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TewebJpN"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so285388eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 23:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780295456; cv=none;
        d=google.com; s=arc-20240605;
        b=Yah/EAIg4FnUyb+0VCC/wrleNXabDkZMHxAtbEVmTk6KyJCs8Uc3DmxRuxyg+C8J7l
         t6qDXPj/Q+zy/CTVgJ7F0wBQF/XXziUlYHgePC5bU9lz8x8nUYWg/6kpICxxHEoptCmo
         dCktiEwTHmg5CzH/zX8bcAjEOpEuBDFfo+sQ/d9CLPiLgXu+mqK6RiybbZk6KQ2M1T1X
         dnrHQOKvgwni0lAlYC+HPhWIxl38O8sd8Wt5dET3MbtUH+yzPPApnv9j1TiyRkw9IpGZ
         NfYIb1oqq82fdW3Zd01HBtWg/qXeS664+T6j0IXiU0BzJTidKFIQSuxOZ1BhSljDrfqR
         nbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R1yhEG4MKoXjJ4bO08OeDXprdSO1fiP+peqcjquLtrs=;
        fh=NL8Tv678IOmNdkHSZzrHBOo6DXg39AKXGkE+/zIsLt4=;
        b=FGX9Atvp/yN7TdzPvCehyCiB4+6RlVCYgl5dTplzx51BG9lam2T8AiomgPFSGQP4ZP
         G6tZl5Y5OUmIpGue2mBcffMdZlW848mA3osHG2AvvDOlly/cMVlrYbRdJFKhL3ribi1m
         iEJq5cj3SGMzjHjg/2bqUtt11VttTB0j4WWTTC28k35Om0Oopc3dWbZokWI0TI7MJcro
         hA9Su9mIG8+sDiM8RnmjAjmcegnwM+2vBFxWH2K8e68TeaqhLT1vxSwJ6iOM8E1pGzoh
         8/jxU3czX46sjGGGYHWdwQ2LxzaRWEDRKqrowTgtk7X8s0siyed5kwwJrZzWq6scLiHP
         HMOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780295456; x=1780900256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1yhEG4MKoXjJ4bO08OeDXprdSO1fiP+peqcjquLtrs=;
        b=TewebJpNtT6qAjTZUa+Mh16aWsN8/d/7b3VddeBekOT6dBZYswciaPWb0aQ5iZJCyf
         4baxLX5lRuW6PXHqZZteTZ4MYFyYmFHYxQewdtTUz0v6WZe3N4Y+Za52bSSBYcc8atW9
         XqKFeoRGNJHG8Z4l78aOK92iCqV0zMYn/DaIbVIczgsCXnLa9EXoQqUE1K0KAayO697+
         fWAO2owf/6pFEgo7Fv+hfs2mlEcNf0eDEfJkButpuEu1KNF/HKxVaCbj6K9LEtkgD7ar
         O1mwUp/kcuahZ4f4CWbhwGwTuoIGoyMUlvE3tQcl7QlXFW+kk/wP4hWDB4lNux2EAOpj
         PRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295456; x=1780900256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R1yhEG4MKoXjJ4bO08OeDXprdSO1fiP+peqcjquLtrs=;
        b=QzAC78Fj7ueJqDnlRhmsZ1MtSjNkNsI0KwWC/dmuLJ30x8s7++hFyp91EewGdRjDFq
         VG6eRy0pow3eZagrHzRE1t7wXVm3a3GhLBLaE06M6DaTaRWReGOxjpAAnWOYOHr8vDtj
         0NUMD/1PDzjynj7ezjmo8DhJoAM0eA5XCSfPqC/D80l5EpaBigWDAQtERRMcNB4K6a2Q
         NzvyyZwXrzhaDjWXZRIbMI0D/6KuxbYFdDXGImTz2p3rtKYT6x4tapn1W3Yzm75XpvuA
         qSiqsackBIivDIYMbg3K3bwOUnKEm9lJ19NwVWiUqPWnMqaiyaZ6LDkGRZd2ca4mtcQg
         5siA==
X-Forwarded-Encrypted: i=1; AFNElJ9CHuI/Pq7ZQkJgEX9z/uGX2rfa6ui8TnxzPaJCSDPFEwlSE2UEf3TvNKVf1V4e5j+GBc5lAwzNWn6YnhFaQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb7gYTtEYldGnsZZH07PQ0asnqWIldboacGqdNB5cePrAJalqF
	22lzYkP2Ey7f7HuP+y6FNtq/zcfOPxC2T/y/j1JRSiSW127LfItgNfnQd+EK82nqNj8/wXFX/5d
	zbMe+0u4kIIX4ihuoquOIzCjZxh/Uvnc=
X-Gm-Gg: Acq92OGLNzakOkPUQe6cPdNfZiP48wAILLGVgELqBIkjsx6rr49UhpXOl/CxCCVZpaS
	L57PSTPVMu6q7FUuj/D/VP0WUFN5bsqKmdcPj8TSAmVfmgdL6n1ARxobLrZ27G4SWQfUIaWBdqt
	kBv19cJNAKj2RrT2NMtmwzoap/BhwfgExtG6uiuxnWa6e9hVvqqNDlwrFyGP8bhyjfiZ40tbtiU
	OJkhVXAngAOjYT6vcNeTfVBnballiVHVyu5PGY7lNGYV+4NggsuS7c4j/mJcQ7xZD6sf6++a0ke
	qOMiWolcR+DbL/Mx9zpJ5IgLAhJG3CMiiaVG/sY0tavbE/CQ6SLRCCPi0m2AoZRohSlcTt5tPZI
	gQO2RuYNUOr8/jf6wOkvVAGzaHRarS0NUTw==
X-Received: by 2002:a05:7300:ec08:b0:304:2af3:5fef with SMTP id
 5a478bee46e88-304fa70effbmr2039142eec.8.1780295455709; Sun, 31 May 2026
 23:30:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530095809.213611-1-ojeda@kernel.org>
In-Reply-To: <20260530095809.213611-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 08:30:41 +0200
X-Gm-Features: AVHnY4L74PI_Op0lO-oFiwBsbA3m9WuT43J5CDI-t5H375DzSgGheCIUTH6PY5Y
Message-ID: <CANiq72miRU9Qz1+ehyNa26LaG4LbT1XcHgKoODRhoHBxxDdHXw@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: clean new `clippy::map_or_identity` lint
 for Rust 1.98.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 11:58=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).

Adjusted to "6.18.y and later", since `cpufreq` was not there in 6.12.y any=
way.

(I didn't use Fixes: because it isn't really a fix, although as usual
it depends on how one thinks about those...)

Cheers,
Miguel
