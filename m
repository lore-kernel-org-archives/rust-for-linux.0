Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEB6344DB1
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795382; cv=pass; b=fNo4hWfp2ETKGAUqTSsZIV/cc2w7GBvwvRthia9OI3JPH0K3fuNd7YP/Q74AeAFiiYp1K79hXYjSVOKZ/qLSFR5025MLV5/P5P8puKeJUZo7OBJQykk3KAOLvL2K0v/uyMkjhyBWIAAzuRfYWM0cWzptqrIEgO/xQexdqnbpIq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795382; c=relaxed/simple;
	bh=3GaZDx0rQ9Fksiy9siV3i5pz9Hl2Ce5uUtde21t7sAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDMm/A0xfmcmcUU8QGdKmD4xLo6x8sIwKNTnMSMatFS27gGlTuQIkhA8nhpNei1bKMCcgfysA5qL6bErv4XowicALcmpUUoezlY3eztQ/0YyIvM/q7nUHmiqmeT3ur0RkAY4YiThfpcxCs7MB0UDyGKd8xm4Y2Y0bO1SWj83/kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A27Rd2uz; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A27Rd2uz"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bda3b4318dso628508eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 11:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776795380; cv=none;
        d=google.com; s=arc-20240605;
        b=B4uSpAKbCr7F6tveccgpBUiaB2pFwU5e/sOR4sE7yrrnAtJldU1vkFgQ+TM+X3PGPx
         ezaoNTZlFPnyYEePtnIrmukY1XYcoEqHYkb/Qy4jVOZ/msPBYSVlpMvyyODoFhtUukko
         r3eUCcuLqudefh2iYC1wB1ZLqz4+fj+DAVOwmXjQ3DeaFalo7yPFFHaHucPeGIi11J7C
         qV8knzhSXqkj5MHa3RkfOSbG1cqQ5QmAWMcPSXJMVFWBrztZIOKoZZ9rF4ze84+JgJX0
         pp2IjMeiEechTRH4pwM0Y2mY91HU0Qli9UVg/Gs0bfY2ev6r9Ot5IEJLS7EoNiGwU1cD
         918g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3GaZDx0rQ9Fksiy9siV3i5pz9Hl2Ce5uUtde21t7sAA=;
        fh=kmuXE7lhlLDl3q9+HI8L8TYuQV2B5mGXr7RJtGh6VvM=;
        b=BlHKLnmi/F1jyEBtoKqaZK89YyDsOaWDNfqTreh3WzbhdSAkqlf7sOpMsj9Qcz1Z7X
         1A5SWHLp8N8VcLN+orup4Bnp/JARokmqXp2IiQZZFpTZr3hSFzVdnVd2ax2XPgxXF2wq
         Q+Ke6X8rQ04ux+gc8b//iONbveuxG+PxakDqc2nPr+Xyl8akjTnzAzLgLogECzunSV2y
         cMt3ZJ7p/xTkZZX7nHVCnQBPFo7+5DeFmYwSoLl7pj6dcN91VCMk9z70Gr/HPnCULS6s
         N+A+yDnoelMXLfML2PfPT/lJFA0QRxgf7VJ5s0o8LmybEAIYKqgfNQATd6zvK4fAI2RW
         1PGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776795380; x=1777400180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GaZDx0rQ9Fksiy9siV3i5pz9Hl2Ce5uUtde21t7sAA=;
        b=A27Rd2uzq1Uf/eIeTxqwj70lt8P7QIyGLumTD1yX3LJ90EX8AcIV/sNdarrFCz1G2/
         PhLr1a5BYc8lvB/TZvSKg5D1LuBNWyiTwbry6fB97eRckqtllZpnBDrYA0j2r0337QJl
         WntlWc7CfS8GXlwFzywiA4Kh/tqtgaKpwMeL4Fj+FFTNDcnwy4WV2678NDRf+8Mfk2zE
         RBF60nEyVAwq8OoVUZecyuRljHg2MNGpF/kmzBOhW4bfRVJjUpaC0WIlDHVjAm4gDsoZ
         4Vs1xarE52QjpXJ019ffC//1Se8yLu5c0pbxHSGwjxxpwVUgIVh4z7aHSfpQjiPBNhOk
         +Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776795380; x=1777400180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3GaZDx0rQ9Fksiy9siV3i5pz9Hl2Ce5uUtde21t7sAA=;
        b=Nji3XYAskBYEUGJ3awDk4VuXavpv3EBI1nQLB2IYeVVPfJV66wDjX5CDcUvuDbwH0T
         a/B15bqEnmBgzgPL4ZgNHtU4VrL9GSYbs26sM14hIjIMSfjCY/1yMy9H/4yDz6WgOVKV
         XMZ/heMVan4uEPe/T/a3W2eV9IhhYUGD6Jqwa4Jfh62cjMLAreE5c0MaSJDMCpvKQ94n
         BUbabIOuCnp7wgGSEIN1saQI6g5bzYDFuaui52Ba8itll51G0DfJLr0dcJWP+N4ucTVJ
         puE0SFaglPuPGUjzU8IggXi+CpbPvcQzlIZKTviCpgm4rbvOdjWm6PYRKUVWgGbsRzW5
         4A5g==
X-Forwarded-Encrypted: i=1; AFNElJ9Dat7akhj6drcJ8f3Zk/MZ38g+TTTxzsuqZJw3e/RKaCLSpPSkTHniVBOKiZrMKv55wGHKqF6Q+KOresfazw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYatsZTFmBnCZx3KqCi2/lQ4uqeyp8aCBLPIOpYT8S7MFhHsVy
	BdQc+/WZWE0rGb9TEuihGBRqaaMvkB9iuwp/EiAlGMPYQeM6PX6lPqqnNb43GjWw8Io+HELT+jF
	+nH9ekE8w8fJytc5Z9kWSTX287MjELlE=
X-Gm-Gg: AeBDietHJ3+RcWRCl4S4aWraCAuK4E2ozEcpwOzzDck0XykKa7VlcTBszzagT5m5xRC
	p6CdKZP/krlvGBNtOsa1d4L2YtbY/esgnoa3luY61sqGSFFJXwazLNO/Ca8NHi7pZjsH3gDNJj5
	1/UYX1+7cXVf3JWk95z4bSRLmlliMjLvBIaG1FI3ZzewHQaK4kV6pXQvVQSoYy+p5Sn1vYVE1Fp
	9jfmmZJ9ygIGY08RvEh/V1eXQff/wtLakB8P4iP3QfM9sigM8cKzE5h5b6YkqtVHiv0s1IozlZL
	C13bkNCKaY1SV+DT2azE0bzkGGB98+rijMparMTeEVtvnHZn7f72FvzjFDqarZKf0ILwy71RvUk
	lkDKNS7V1Lm4NwrJcNznJBx5m0Wye76fsGA==
X-Received: by 2002:a05:693c:414c:20b0:2e5:5bf4:886c with SMTP id
 5a478bee46e88-2e55bf49d87mr2808147eec.5.1776795380309; Tue, 21 Apr 2026
 11:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417152253.2312961-1-mkchauras@gmail.com> <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna> <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna> <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna> <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <DHYYG7A745M5.VQY4GMDJNC1Y@garyguo.net> <aee3ivM9VkbqdQby@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aee3ivM9VkbqdQby@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 20:16:06 +0200
X-Gm-Features: AQROBzC9mHOnbDZIzSWs7JSPScbJTWmOkJB9BCTbBPzo_hv4xsJtqwnMLc9zKx0
Message-ID: <CANiq72k7HXYE+1hhbT8xfL+pwhBwVqCQaN=1xXUuTnMhH0J7QQ@mail.gmail.com>
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 7:47=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> There are some other build errors apart from this on 1.85. So few months
> back in the meeting with LLVM team we concluded that for sometime
> powerpc will be ahead of other archs at 1.95 till others catch up.

In that case you may want to modify `scripts/min-tool-version.sh` in
this series too.

I hope that helps!

Cheers,
Miguel
