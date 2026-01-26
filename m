Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9ED224AEF
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769404101; cv=pass; b=OKwnMxY9zg7XzFUBY3KYw80TGIiRYvrEiUXo8G/MVznO1Gqi8Zc+UJ0LhhuWOHsTLig6LxdC7ckM4S5m6qPHZy8hdh9FY5pB8cezisVRRBQki5aSM2E4TgB0z4kelXi0hTA8H6fDNXjXJ3YmTrKsJNB5JSK5s/RXiO5vpheDA5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769404101; c=relaxed/simple;
	bh=ZBsVD6kxKzurT7H7DtCLfcoGufza6/gI7cdcVlj4q0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCMcHDxUuHya2oRNvS3gWURscMwGHN7+Zq7lHo8RNBwZotIKGSxq0LkC3zbEZblwZW90vkhQd3pUd1lQzUA9OCh1cQp1dRJUI1qydovtOIaxiskmwbrAiNGP3ZxYWq11mYbWClx6aaVIjYSI6lHMf2RYWqwlMnBf2yAhZW7pqAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9kfJBC+; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9kfJBC+"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b71e7dab12so333113eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 21:08:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769404098; cv=none;
        d=google.com; s=arc-20240605;
        b=WDGklz1Xff58DX821XnP+DICquqTOo3tcJgarRv4vxaTVftgIQbVf6pKDP9wxEGnBd
         vfDYsAKrCufTUyEl8n2vkpp7+8INRMzvl57/o2zqBCH2ENeatkWK41Jem2jpoE8QnLSb
         xlKDbXu7S6XMS/Q69jk6wjz+Zrc6w8wgL+Ar+PLPVuImns00IqRQPO65HG9srjfDtiOF
         rsbCVwgqQZv5Xtyk1a8zr/APCwDBGbyMUaW1gylhTYGcYGWxeZLwnxnu1zRoRBfa3MmZ
         GwO3HtkjTVlprLolHQTb5Ut9Z3qouieVJGw8sMmtU0rycMaOT69BoGDjmkbHxiTwgc14
         CIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bsbA3S4vvXnWg6PVwhDAv4/t5NunrqZ0yk7Z9wsyNZU=;
        fh=ZxSWxUS0j79r6N2sO3vIjQYMNM3zchb0dQwateKAd2k=;
        b=aUdsOPetuYMzkNeDLmg4NV1AjU17Ywkc8oD+EgT+T9X5FF7wl6E1JvrCmqFhG6bL2u
         dcZCYlhTinS7qcCf66sSnUTfX4cdHeHBCfAiXyUBJzPD2PFCEr5YO+Cg+9ElP/btiLip
         A8MOpb8IEYFmAZS7IqvVgB2Dq1GkSZV0jJ3UTOEP8AivjzY63ehYFJFuzp+qre5BGqYk
         UUHAGLoIpA1K6cJ7xYLLzyoeZzgyfyHOXVNHkDY5ayqXlC+limp54JypwhskKmnO+z3n
         /QnEaTU+5kMBT7LSntBiYh8F1AczUaHrjJyN0uyh5CTPW2Nw2E6zyc/pG8VlVmyuahd2
         3aBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769404098; x=1770008898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsbA3S4vvXnWg6PVwhDAv4/t5NunrqZ0yk7Z9wsyNZU=;
        b=k9kfJBC+ldCHGEir2hpwOAhElO6egoRCIxzj0IKfTEqmro2/yY4nV/+ZWVpPnASaL2
         +mKMYxEvPEWQ3mA0MifDdWsjJxAV9WDFd60bga1tQmEuwjCMbcYXGnmdKnOy0gkl2ch2
         Mwj8Ks7ue/Tv0fi0t1I2FGHTzLLGzLT7EpWkOR1/bqd5u34W9Lgxxo6NypTHOKYsnB2Z
         KCh6L7ducVKh/8PXfUb+iHCyyPnIdAB5ON83DnVEVnBfpqvtvEurIJrSHBLvIkSub/iU
         dCIDy2cliqsDj+61/J2ss/bUZVs3zCGOy2Q26lc2sW5MOSWlOjMrzV8iWQUqiUi0YrGB
         4lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769404098; x=1770008898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bsbA3S4vvXnWg6PVwhDAv4/t5NunrqZ0yk7Z9wsyNZU=;
        b=n1kn5QW7U8GXNIEAqAfJMS5RZKJH+zBPh09fkt0RPJ84DSXX8IJ2lzG5MfdjKJE+Ae
         +tbpuLtNKwRB6V7509E0N1kn7svxjX0FxiauVdJx8hAShJiVl46oyNQSs8mZT9sXTWts
         J5nzOE69Ds9g+NFTCduIztntuy9yCZnLwMzOKtYkNLuVBXJ7PkxoxPA6qPG3RC517Izs
         ZMjf38Q+coE+rh1UikVF1qVx7JHJpxkYgPPwDyfepMeXRCPfpr2PC7aFZFAgejHGkb8U
         c+b6FXUwRCbDDmwd2FX0VeNTmXGvVFZ2Y3aKqHY3w6qep63hQxHm8LYBvXOQa2f+zLIU
         AQ6A==
X-Gm-Message-State: AOJu0YxUwzMlQuT+KlaZ7UdyPNlE5h7pMEOt9H+D0lqYqrutON/gsBeb
	ekCYe3O158yITjb2tKndwQqAkTLUCE+/E4EoWs1xHidAIhsdWcBC6Qo91dtAm2YDm0UlpYNnftZ
	mgeWYb0C7Yc2rYCKfnTK13ckvAPXcixk=
X-Gm-Gg: AZuq6aIL6JsTIcy0hTk1RUIgaombv3f24kvjkWj0y3muQUFpvQ6lHUmrxz2sC7vHn4E
	WKAhFHLSnqEQX5gP4QOM+vFIWzrL70CwBkAwBS/mpntoaIiHm7LvQAFb3J+1XOZi94plOlmcv+c
	BSm/BpI7AIXcxTWgyFTrJ7KiXobJdLgWldEzkbOEPWIwNDnXnn+gLFPlk+UuhfGETkrKTsHzJHe
	/sCdI35paWHWyTx0x2e/302Hen7/f1KfR6Y0U/9zsre6EE+9H9h0S/Li3rdtvS166apcG6+fJjN
	nKWOWhtk6MxX5FgutUxvvC2BtPKMTvumAy+Y1uYmjEsZhfBOm+EEbA4wF9iWS1+E9WVXH+SsIgT
	/Wwb9CtROP+I5
X-Received: by 2002:a05:7301:3d10:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b7644f41dbmr855051eec.4.1769404098278; Sun, 25 Jan 2026
 21:08:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 06:08:03 +0100
X-Gm-Features: AZwV_QjC45jcqbNpvCzRgWaUDtcYZvulw1uksmCYv_NCU9WJD69mYzMDZ_yhpJo
Message-ID: <CANiq72m4hBinKM4jRrkpZ5nM_wraQ8FMsYtjgKRkNDmK5sS8dw@mail.gmail.com>
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
>       rust: bug: add __rust_helper to helpers
>       rust: err: add __rust_helper to helpers
>       rust: maple_tree: add __rust_helper to helpers
>       rust: mm: add __rust_helper to helpers
>       rust: of: add __rust_helper to helpers
>       rust: rbtree: add __rust_helper to helpers
>       rust: slab: add __rust_helper to helpers
>       rust: uaccess: add __rust_helper to helpers
>       rust: workqueue: add __rust_helper to helpers

Applied these to `rust-next` -- thanks everyone!

If someone did not intend for me to take it even if the Acked-by is
there (e.g. perhaps Andrew wanted to pick those nevertheless?), then
please shout.

With this, and if I didn't miss any message (plus looking at
linux-next where I see Greg picked usb), then only clk and jump_label
remain (plus any new incoming one).

Let's see if we can get them done next cycle then.

Cheers,
Miguel
