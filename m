Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442B93806C1
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140196; cv=pass; b=F6g46m6UGKD0XMKtzKioM6R1SjziWQrpRs9E6H3x+zFLb/VO6h+T7abeCE0EAk13HeE0ITBJ4K9vGs1+x/V4jKXAqZOEmq6LTXRUGCI4v0ju+VJEI6lff4Xohv4Eu10nPrbp5AkuGED1u8d/PrI+z+hPoMWlVyAX8rnx+ECEkwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140196; c=relaxed/simple;
	bh=nL8Tve9qxXBojU4CG3EUAlYMJTfM1E+ZMJp6NeH7Zns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzGjjgJttBBQMYUFotb8oqAIzUqRmn7FtaUCJ3bF8EEgLqswXqro7qzdf8X2arrzSQaT2x+6q+UTU7+AYryRoSLJncqtDYHMmP33FEra2Ot3IWPoBUaZN6XhUKjIR2rL6YhmGtn1Btf1QMrhBwCGDSR1JRtKACGED0+W8pNcf38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBbGtEBR; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBbGtEBR"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2be21f91e58so464443eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 03:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773140194; cv=none;
        d=google.com; s=arc-20240605;
        b=ITGw91CH+sdZOgjIrtjwtsb97wEvzfGEV2nsl3TeR+brMG8HiaUDscGkKGCHO35k3c
         Tnn+ilbxMabgmIWgAo3Y6kksi7bumjr23RgUrvc3MNcGAv84Sd0V3yEL5K6JWCRhz9xR
         yLTP2u00C6cjaP9++NqyQfhjYUISgIhmLKq1Rdsax3Gj6qJoYnmbZsJ9xaJv2W16WsNl
         fFP4XQU7YeV6CNkG33H5qb4gHbR3xzzu3HEFVuXaDlowNFqyFVGl5p22/i8tLtKET1ni
         9yWA9zJ2jUHm8aTlatpQ9Wb5i7+wPP+b00PeUXRLFzf4OehhCbHU9GWjgOUQduC9N1Vu
         74UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4qBpWaqAk74juZmeca9VRmKlmVoYIHqDYNOH37dt7g0=;
        fh=ZxSWxUS0j79r6N2sO3vIjQYMNM3zchb0dQwateKAd2k=;
        b=gwJyL8V9nxIgYn1AIoybq6iqT+Ia68uv262BfGTmwYlOOFHtDsMegTiWET88vETRqk
         mfdoGXlVKbtLwQOOTlwrY4Jx6d70bZhfNn1LfhPvGCuUioJhjbdIa6JHZZez7cwpB2Zu
         YINL5Sd9XoXW6l/Kc+4rW/172zY14t/JWGLfgnW7WJpyRMKo3O5VmSwgJYYJBNorrolN
         EGmO20+ZYea7XED1HUePREQVvFmkUHw7b5cHD06PxNnx5B9QtDBuohPIyNVGaZwpH9B5
         AsT6mrtHPERn7v7wJNDG2Vh/si3fVL3EdDkvNtdfU8AsL4nlCdoJDU+HcB2xhixVyrUu
         lY3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773140194; x=1773744994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qBpWaqAk74juZmeca9VRmKlmVoYIHqDYNOH37dt7g0=;
        b=MBbGtEBRBoxPubDO7aR6dBNxnj1NeX5HfI/2iP8Lzp9seSiN+tybz+fCRUtGLW5x5H
         Dk4DqYa2NIr6W29OV7/5WrHN0FEJ0+ScFhbkZQJ4OBIDWeIUWzj5869zWBkvAx1laXES
         Udu4UtFP+aCcp5tqTGuMUR8kxmr0FTGzsSlplMqaY0hCenwPTPwkdVVfNjLo+2nmkSeb
         ZLZA0ovPwmjNnfImTXGvS4gMKe4x5tYPKrZqYjvhXgCHtOZOaqyl0J7nwehmYLSwCQiN
         4RvcjhTehRXfc9XMyLghddQw5UZF09s2CvUvSITa7ja7/9lOwh6jaZeNRFPG6ODik9Ho
         PR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773140194; x=1773744994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4qBpWaqAk74juZmeca9VRmKlmVoYIHqDYNOH37dt7g0=;
        b=lIGcwylyN8tHOY3cTEZkwSXRibiW4MF6F1szCi3AtEMbIfklz5Rjf0YkyNtSxYcFar
         uMESlMt5CNPS8Lf2CfnsVqusvFtPfXfddKtdl4/O/0K3F2dOg5z9uW7b6JwYa61n++MZ
         27XZfwZfynQBHFJ7Kx0Cru7lyKSbw9KBMs0OUdi3FT+VvCFlVBOUzAvrUBHdPdqjLuar
         FvL7wpJrHSqCVuSoWoXxTpFhPwhz+ZIEJ3xIBI4PTti0JPP6T7KC4lto7XpYE8c3P9am
         SvAWbmza5/HZLHxH0RwkPV6pVBQFE4b7/JhZcqUee1eN6km2j8Vxcc6ILCage4scRVID
         icpQ==
X-Gm-Message-State: AOJu0YyvA7SzZoz3eSGFFxeYLkwNG7C3+Dc0/DJuFCeaORoNVFJEey2h
	aw97AI70k0qBgi5+7RXgM+rcCEzYE+JC1vFLzT/i1CJKPjNJWOoWwLVh/zH915lC+0GvYkY4dVy
	I1g98QRoMGW5g8+1svaeqZ5Rwk3YqlqY=
X-Gm-Gg: ATEYQzyUniA0XOFkNTeI5AaC1T0itwbmnB5g4E8Qz4SgkWeJnZwCOiHlZD3n/JGEzVF
	pdbECxa/h1H3QPp7YYX0E3iXzHGizEfxJiADDNjplF54pU9t/LuAjVvVwM9moiQVnrtc0AAOX55
	ATnqimf4crht3yP1lpGnY/KmKGYqJsrg0bZPAA7N0q0+HapeBWidsJyeEVtksUC001y43L6CRdZ
	MZptXT5EFq6nF2tLmF1Z4xaBADRydU/TEjniq62xiUWZBVAGwsKUsPDxvZvOpxIUTt4gjEoOdN4
	IbPtRNhOsCDRz31jIqaQCwGPhl1kRGvmRWOktKboB37PVfSD6F//pvbGAjxPzrEEgUBBg621zRI
	QJF93PjtFgiIxrpzgBxni8cQ=
X-Received: by 2002:a05:7300:ef97:b0:2bd:bc33:ca32 with SMTP id
 5a478bee46e88-2be4e09ebfdmr2731651eec.4.1773140194353; Tue, 10 Mar 2026
 03:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 11:56:22 +0100
X-Gm-Features: AaiRm523FMnYeZ1Cbp2n7uyCKjNSK8gDXCio5_BkegPeyUfSKYibfT47XJIo0_0
Message-ID: <CANiq72mT2-8m71NtnodVXVBRkhUSiK3Byq5OkBntEQpW9hbU6w@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] Allow inlining C helpers into Rust when using LTO
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, linux-block@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Vitaly Wool <vitaly.wool@konsulko.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	linux-pwm@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Mitchell Levy <levymitchell0@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, linux-usb@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, Tamir Duberstein <tamird@gmail.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 1:42=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
>       rust: clk: add __rust_helper to helpers
>       rust: jump_label: add __rust_helper to helpers

Applied these to `rust-next` -- thanks everyone!

With these, the series is complete.

Cheers,
Miguel
