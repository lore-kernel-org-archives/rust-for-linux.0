Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BDE39099A
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903687; cv=pass; b=ioCPlSYQzBR/7ewfn5XguYOdJIB/eaqphSBTKYmENjYrtMaqaXMvdVawoJPhp97HawovO6RvRIovNqq/m1MkxTqQPQgKVCWLZqyyK6azsbBLIiomRg3XLp+58f1YSeJHb9MmS744O2azPQnXVVZuFm5lEHB+KGkliu//gofSotQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903687; c=relaxed/simple;
	bh=CBU0HKvAvGrXue0DJqPXBxhXGvaIU+sn2F72Z8D0RO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWIwlWvSAkeyQxtKFJDIU4PGR5VFOyfSgoOpZmiU6S00QdfRxQTSOckOhb0A303/bpVawfaBB/MBuAYtpuapvWy3awFdR2TLUqgAAYp9H7g3jtU66kbJuWjhD15dxA6NLv9bVijyg0GKl/vsjWae53ZnldQPD8BzWid594YuINo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmidl0S1; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmidl0S1"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304eb0fc233so318551eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 00:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780903685; cv=none;
        d=google.com; s=arc-20240605;
        b=kbAG2mjhRhN+qjv5qvAJHtr4WCoumTBPlU73Gwp+MM3nqaqZBGAAOVOa+LntX8k+OG
         fT0DBMazyiFxVwh0LVSy0XxW2wfSdgC0/1QtOHet2B+xVbet/pP/tKOqiUH/7NiZVGZl
         tknAmxd81sFnomENEAEiV7vv+Fjmt1ZQeyFSMrKRQ32F7T3qAQHqRjlCwyIrVvUX2J3O
         y4uxX/zDQgSy7hZPLxst6tIcV40SxoSQd8zwQnlQW+wvEze0WDVrw7Qhvlb8XBeQqG2y
         vG9yts2UIW7OQi53VOupjsf9o3+6/L+u5O/0ZQ5QoOcWsca1VK1IgkJ8LRqIQMY3uIh/
         iLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CBU0HKvAvGrXue0DJqPXBxhXGvaIU+sn2F72Z8D0RO8=;
        fh=+1VTlhuOz0WDV5/6X52+pDoDspJpcTt1Q3sCTFg/qa8=;
        b=OSqAdMHIBRP2HYVt/VQT1Gbpv31WG4KrKh5DI5/mYAWeKJMtOpHGrAEj8txHdRE8Hk
         8tEvVtDS9oVjoBe8K2w7oXZs51/77Wav5J/CDKRAp1J/fv3tyZrVUVsORt32yHs6GIiT
         a79fbyJSa9IW6gL8kZHwXgZBPDuy34NfZBBsMTMVsGEob20oi+MjUyPH8ZBXq6Izj7fi
         yRPaXdZLRxradlfPNfFGml65FtGQ0aIePSjkPML0i+OOl2hSWj6+NYAi/3wkwKkwKfVP
         S86COg0b7qxlcYBWqisNwdp7D35XkVfTwV6pO+tBxR3qwjB/XOCe0VBZ/FIxwxC7Bdgx
         KbXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780903685; x=1781508485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBU0HKvAvGrXue0DJqPXBxhXGvaIU+sn2F72Z8D0RO8=;
        b=dmidl0S1frEXIUNagDgAoZa+XOIic/a3mRs0llhAWLHq9QqlBPTQ4fXNtRCZpHuNg5
         dAjWdI26iFRK77Jp7nHKEEkWO19mnHsD4FOmz82z7DHP1BYCpx1XN/b2WghXWbSpal3g
         WkMmeka8OoWxqAjvNd7c5R1q9+qk/+dAN28xqGsE/CO8aAgeYVhvNqi0sZTsLly3+C5O
         qzwdqtLbxk06gD8zpJvkGx+GWOQim54nPyizm04d6U3gaHeltSMMjozaNDOOuiMaYY2V
         W5zAlah6Zkkk8VdccgFRq4oGk7699ulvyIMafca0Kt4VmUdKzCNF383j0d83NEjHlHpr
         iZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903685; x=1781508485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CBU0HKvAvGrXue0DJqPXBxhXGvaIU+sn2F72Z8D0RO8=;
        b=ciOcSbpZ+r1eMcUDmro3aI3A7e+gbqpgm9pjXw5A+400/YTt9q1FiOO6tBNIcpQLsW
         e+8t2OimXTxL6MuJW076DnHvI20M7ghLM0qIBxIk8V6vvjdEEt1rkzJEI5Ab+UlRCaB7
         45gOyUSY6004mAUVhkrucl4QG3rwiKvQUSLNQfvkLK8jT1VV0rfTGtuLgA9KKMwJm690
         kl/nF4Wy5jNtjbYDnVeq3P5BDkKHJSpSPexdkNElkxDaJEMF5+WbQEAnn3/kz1XAW88g
         FQjT6ow7OGzZ634GDaMypZM1sr0L5+DBbF55tM2e/qsH0pSNyRynKw9keQWxjJGwm6YX
         rHtw==
X-Forwarded-Encrypted: i=1; AFNElJ/m9zLK1Z0GNIpMRd0Px0eWUodxCCFnaiM/HzY3BlVk+OuBUqJCntwgGDg2q34Y16I1bw0ta8O12+ZzTozETg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyknVKBPLe9tDoPkt/PEkRxCX792sK9W28COKb29oOMR5uVEp/S
	LFeNFEtlZZtPZ4xJFjZqcnAbGvI2zQtMs82c9AEEHKvJXiPsZ7sscvabkedFel6t8iK7PDyBWE7
	KnsMM+669HQGqJNJu+xZp2HPZQi5Na1A=
X-Gm-Gg: Acq92OFAjDtBjXe+AMYfN02eygU+hA/eF5wJq/5JzFDouAH/3CZ6TAmXyLcffmbEmJ/
	aFANTOF4fn2CvGoM1HweVcr7NC+tFTmX4ExmcPyBYDaHfCXcsNW8ei34nmsSAnnZD+FfBjekz3w
	6nK4xDCatmVkcBkRKmguLStOjxGAZ975MAOr4OtxeMubvblfgU2k5c5W+ds+zWZOqcCTrJ1evdJ
	0ep5xxa+2jeGqboUzfjDX1G8p9nCUKu153nNHfZDm0+39N6zHsW8gUJ+Ugrtpe2ILrMtDsBvXRv
	nmLOf3YBmiUbgpff3ktW4O2Ip2GtDnrBNTpNqK3lVB8oh4CH1lVgnDzVMi31d1PwNZkkvqT3y/v
	24kNmDo0lNhs4qQd+kK4SvUAJegxsM/2WBzE49LVaHv/O
X-Received: by 2002:a05:7300:fb91:b0:2e5:faa9:ca76 with SMTP id
 5a478bee46e88-3077b437db7mr3401867eec.7.1780903684803; Mon, 08 Jun 2026
 00:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-unique-arc-as-ptr-v2-1-425476d2abdb@kernel.org>
In-Reply-To: <20260605-unique-arc-as-ptr-v2-1-425476d2abdb@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:27:52 +0200
X-Gm-Features: AVVi8CdwcT5VlpLoQnz-nQoCXQDm7gyEVgE4XQiD07VcpMN4cpPxIN8or6YE3RE
Message-ID: <CANiq72kjir2brMJjZPRO-bymJdZh871pmCE-DtHLAPOWYf7-aQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: add `UniqueArc::as_ptr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Add a method to `UniqueArc` for getting a raw pointer. The implementation
> defers to the `Arc` implementation of the same method.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Like Sashiko mentions: did you put it in the `<T>` impl for some
reason? Do you want me to move it to a new `?Sized` one?

Cheers,
Miguel
