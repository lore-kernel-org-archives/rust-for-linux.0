Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792520291;
	b=FoPgXoE67z6p4BSYF51Qz22GEgMAhEwJUihOlYpT7OnBnDBo8g1/evUheyraJQk+9/oZ
	 zFUy+/Q0Xil9Kdo41DHFkokgUp8diJU6DHR/3RcsmBb0vfYtUSzVHTqO9jbmmVq4825l+
	 2pZJAAteeRxgx+HuaPsYAQjFx17DC2JEeg9Deh78FHq2GI4AVkHPVjMFoRAa0unBQCKUL
	 eGHgrmuAm7kMuPcBEeEH+Zjb5457/E2ZZ8UawBvxXG2T79ww5vXRbm62kzGwvU1IK7GqX
	 9+XwYxHYlF9dpAy0z5q8o22t8Leg+Lpe+1AA2wK+RwMkswa1Vyd6St23nYqcXNvdS2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
	b=I5u/bL7B4MUMGNe6Nv5/6pWpJQo6h6KNJH3RZ4JmD/Qu+2ZsRBYKQZ+j5jWWd0yrvK1c
	 J+U19qqTR1Z4b2hlDgUCMz/jtuIQmRmRCmxHXK1syPiKevG8VYsHn/cTmd8lC9VL4zcyW
	 3ECSE3JtB7wdYaDFWvfgO8suUiHvGaWKmYKSo4yCi+ajm29sSnh93xUlLTad57t9PifaR
	 OerMP5PBNrLU0iutRHft05/riNyrVYyltoKgpmq9B0qDbv0PcV5sA1T0TXcCAprh6TeN1
	 u+BdY0p58ZkfhiYxd5TyBsxfoDnphZ7eZOY6H6j7qTogFH6fWZXMwfF7lvoWpWiAdEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sS0rEHMQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F87606A327
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 18:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F87606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sS0rEHMQ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-34c522572bfso371655eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 11:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520290; cv=none;
        d=google.com; s=arc-20260327;
        b=CoeHcm2auBm3gxnXJTPlMIDki4esRkN7X2/tGcv59qrw9ce4LcZXkeL5gI8REk8H0u
         02eKhh4RhyjuJfjknDa5aQrEzrZLm7yjVac2aJSUZq/l3kK7hA62PzxHhwQbaL3knZHY
         0onUxLQSvQDT4LSsAiOYKWJ7nk7+fXKqVdVWZZAq5aCsK2LUJ4pdgA1r0dUFjgBFlNXw
         sFxSRsbKDiNrzXXvWb3RJFuO+gLXwn5aPT+E+xq5LiTerAtLAlAxyxdzhPGIBQ4PG2wW
         ppE/mL4fHXV6w/txfwzQpORqlLHjl5Xuofd9f4AqCHTvsVOYL24mJrz5UjqZ8QVhXfUN
         9Vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
        fh=bIUymd8x8UcOBbEpMuXECl93ayDh9oBd5E/DlRwaxIQ=;
        b=TJ0+ia3O5ldu91xuQCqjmJHHBhjI8WjP0v49IclNmuXC+nPHTB8XugdwPOBJS2tzNk
         +Dt8LoHTo4nlXQxvO9uto5yerGiPyJmWoSSlYMx+JXeSO1/OOd904Jr1Yt/vVuZVozMe
         ABkaJGb+FJ/EW4aRvdX5G+Y2xSRMcOCVsGphVZ1H0EP30Y+hD1PzS8A6PCg7W8YeHBzP
         P4zO6hU4kroTUiiTaQVTMl3TidjiVyLyq2WbN59tTp02TEtB/ZOLsDJc0Nfy0xP5rvfe
         iadDhxw84LHYd5xCw1/v8ZYC7bCkykJkrCpRqTd5ROlA4SXVdppc3Rp3G5cF3KkvbzZb
         XFzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520290; x=1793125090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
        b=sS0rEHMQueJQYyftG6RUDVM6qKSJEAc2p7nHAsYfeuZRO/4RAk2YGU0Nemc2ZEWGqk
         rdfxdujW1ntn/hMOBgwbrPy6mQlkhq1c9KekbTB6D+YDJS7I24/vu1LUbndc8QdfNHLZ
         pFu96Mqwiu5Ed9yFVcp6mUEnKfvcoT+XcDvNGI7EgGDYoEh9cy7Yuon+SPf7OLt1lXis
         6lKU/5AJ5phIdQVOpdOssLd70IRaCSVm3T4ylaTSSl17+HtJ9FnpyktqXluTvdKBcX2K
         HVsxFZlzRd1JUI33zwDXSWf6Xp74k/J+YSHJUqrmHqAd77JDresFViPQebmwhrPjo8yU
         j77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520290; x=1793125090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpYlkvM4ti6kEUYrcuZl/sv6k7WOJebbZvwlkRO9bkc=;
        b=tb6TL4TuymB9Ipr9+DPNylUVfG4CZXakmGSwS9jsRULqAcYS7tn38ZxTzElnvlqQS+
         sAckX3dJvGxsXHuXhpki2Bf/t4SiFMYI6+IIydoluTewNoFeCkx0fWNhGwiSETZryD5h
         mtIXwhSfE1ehTj7ipcsbKaeHwnhdGnEaGCgduJrtmQqIGTjrU5Ln/6T8hnfjh6Lo/U3x
         oszJFkYVFp4kvAsuYJFWro8KdmJO9MLhCkIHe2i2pPu5eJVxMciB+htUuWtiz629xYCT
         y/qXBSqThoKnYYLtw1A89j/IhTGoZPP2zrFey2tNSjmW5eRfURXenQwAO+9Fb+1gxvVF
         zSig==
X-Forwarded-Encrypted: i=1; AKwUvBz3QoxwcOz7IbIqfI/YxNe18ythj55Pm07oFWZ4dPlPiyeVfzGwkczBad6MYquJVM93uewmhaZ1Z+I+i2FYRQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5JAPgIKGMhG/4x16s4GHdhryzSOe/IJ6EC1N66tP++JNylTyK
	UcY+iukDsy4bdAVC/CfkJbZrk5cADVqvFjN8XGKPa71VnhhfEkDpAqjO6N+EHakJjtivYaWRMG7
	DwHHLgqrV4dSGbhhwX1TbwfqmbS7b4AQ=
X-Gm-Gg: AYBFou3hcPGJUN6882GshjRXCPIOk2MIfMfs39SBKqbjNdL5rVcsj/dI9q7u3PWX9Tn
	XqVCyw/3Kb7Xz8230FgWsyANq7Bk0g+RC8iVrwZWDJ1XxwWSFOj9cLcClkN2dstLHs2yf+rW8Yk
	Wod4HGv9y6zF5PbqaBAqibTmj4b731EELYYRZzflVoryKLQaSoRiRrjeeIvPczpNsObTbXh8MrW
	Q8asZSFY9EeLFLgZ8QVZmBhc1bCCllI+gyKaLerqmvtF0B0Lmh81SyjT32d49Dvzlatu1kEExbU
	e0S9y7qkcuf70F3oOanBbpeuJjlHxAuCNMjo68Q4KxV+mzR4LJe29dgKB6iBGKruNJ2106ne2In
	oL0aDGqtI4njyOyQPvaaaqcH32eYBEd40Ke4yIydECdKSDZfgE6t/CcWkoJyOtAOpcw9PCosZk6
	3qRcp0lGJJ+AU6d5ip+Qh0r6r0Gw456byEtAPOpvVnyUP6cMvUc27JxN/NzXcUg5cZkalOapH08
	DpxeigacNSNH/aBBYVYHJgrJC9Sp89Nu2XdsxW3z0pLHz6JRgXNqT6yeA==
X-Received: by 2002:a05:693c:2a18:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-3674d349c2amr90750eec.1.1792520290085; Tue, 20 Oct 2026
 11:18:10 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 20:17:57 +0200
X-Gm-Features: AclHuK8Pt7FrY_kqpDoLQTxwm1rIv4S-Fph5tTJSHjNrWvcTVOiO4UpxaONIOSc
Message-ID: <CANiq72=-rg_nYHCn_DPczQ0tNZN-27TVyvoC_QvYbMZkAgAQOg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for hrtimer_restart
To: Sami Tolvanen <samitolvanen@google.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
> generates as c_uint. C calls them through hrtimer->function, which
> returns enum hrtimer_restart. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
>
> Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
> for lru_status, and adapt HrTimerRestart to the newtype.
>
> Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Andreas: with your Acked-by I can take this into `rust-fixes`.

Cheers,
Miguel
