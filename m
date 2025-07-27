Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD2205E25
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 20:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753648693; cv=none; b=ljH7Hm9IPuliR4qUXn7iycldLPgvlzw0ejW0Hqmsx8TG1aleLtzeHPl3+W54aG1Xsgm2mA5vGH2j8ZN3PpwSocqedr+GptC9XkfiGXgUUW/1dJVdISxAOHH+FZSGZmyeELCshbKUzyCGn510VRKm8iWn96C2VC4YNNYZ1ADv2pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753648693; c=relaxed/simple;
	bh=+l3W74Ney5fM5Mf8fjOAAZDrkNwH+l4DjqtmlT60vL8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=FAGcnhBiN3q4La1PflPoWDEK4EWDAUTPmPFcCWfwaJz1VQ7v+h29SSSWNLMtmDMqkzaVudIsQcqgc+0PlVMYnlI/ldPTAqn1v/dqu58EpRT6P7dAJkpHsEVRLrFEpFlNySqvQ4SLu39qcpozdG4p+578rZIiJ626EySypPxVfQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEZQCgZo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEZQCgZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF32CC4CEEB;
	Sun, 27 Jul 2025 20:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753648693;
	bh=+l3W74Ney5fM5Mf8fjOAAZDrkNwH+l4DjqtmlT60vL8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=oEZQCgZogqy2KUi78JSyfgYbmlD279LBi4R7HxZcFQ9vv5M0qI+EyqJgKTDlx1sGW
	 +dl74+F88KCBkBjWDk1aFsqT0TYzDRs9+x1SVpGD1jRAAzwoLgkWCW3bsITcdEL87d
	 zcm9B+6k0cZvwId+YOFOB4eYrn71CxSZbUiYWhrNuuoE42jcK2T1hVZbpNm6s5heec
	 Cd7H67U3DjlrikklKq4u9vSYh7Zfl4Jp85shu9iAEIRTKxwGPsvkmfyeVrg9DqW3A5
	 qW9/AEeVg/hc8Ob9mEQKP6CoDoQ+y3pUNgbAXkg3syQFYKA7diEoj9P2GKX/itPfP8
	 aooC07TgImS3Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Jul 2025 22:38:09 +0200
Message-Id: <DBN4KU6Z1RRD.2PKQX314UWR95@kernel.org>
Subject: Re: [PATCH v2 00/13] `Zeroable` improvements & bindings integration
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250523145125.523275-1-lossin@kernel.org>
 <DAI9KRPT45EH.RD7AB7OI1RTR@kernel.org>
 <DBN0E1JW5JHS.2RU9ZWYJ7TBVM@kernel.org>
 <CANiq72nzG98-5qtmnf6t6bKctUTnu4tbAwM-_EmZmrZ=-NeUPA@mail.gmail.com>
In-Reply-To: <CANiq72nzG98-5qtmnf6t6bKctUTnu4tbAwM-_EmZmrZ=-NeUPA@mail.gmail.com>

On Sun Jul 27, 2025 at 8:17 PM CEST, Miguel Ojeda wrote:
> On Sun, Jul 27, 2025 at 7:21=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>>
>> @Miguel, I guess this flew under the radar for v6.17, or did you have a
>> reason to not pick it?
>
> I had it marked as applied in the spreadsheet -- I didn't notice you
> expected them to be picked as-is next cycle, sorry.

Ah my understanding was that I pick the first 6 patches and you would
pick the rest. I didn't look at the spreadsheet :)

> Since there were no other comments nor Acked-bys, I guess it flew
> under the radar for others too. So I would suggest re-submitting the
> remaining ones rebased as soon as -rc1 is out, and we go from there.

Yeah will send them, but probably in 2 weeks-ish.

---
Cheers,
Benno
