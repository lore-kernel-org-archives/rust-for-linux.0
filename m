Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794298560;
	b=bwBuf+LH6gOEOrmKkilsd9fOIyxTrbjrY3eeIQjcGiY/YLoQqJGU+S9q2csef5kV4K16
	 maQX1cSazLN8WzHkkZ/G2D2H9JOfy9hmrqTm7b5CpflckIIFbfJUMLHN/5qpaflTmVr+I
	 LVHxGtj9XzPHXftAMhL+jAYLDvtE6u2P68VoFlW8PlDjELUkhjHFa/1xvCaung53jCG/0
	 O0HQJYc+vd6n8fKMGiG/YBmerqygCYYn+5SrYweDkc/kKRpSUoMZl6RMKIZreWUb879im
	 uhzsMfnoxrDVfQ+NnYVRWL+jt9++fVcbViQOpemgtIahzyz5LvQC4dL71EmZ2JvdzsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/Xc0/rpdCy7AH8vJ8uevr6qJbvz6HEgRC2sFXRCHrFQ=;
	b=a6ig5laoO8RRKJTfsR0XH2wcDwfwTlBawscboGXvqaEsgJuqT7Yd+KgV3WqsJHzpf9vL
	 W1Lx5ayvaxD9cuoKlvVc4mM9Or6vAVSpGLcpP4ppVAK2wUz3gGUyI6YWI+TR3SvBGvogo
	 dqtZ/ObwfeyhIgnge+G9JumAbAHFLeoyNRV+7iNjKXnDYTnn4zJI2VElRVae2byDw3Wrk
	 qwcdkzjC7uCinMJqiNyfvjCi6FPfBwsII7uxaNM+0yU1hGhOTxWzvr6Yj/tI3/da4V8+n
	 ZR2FtxFVaT6p+0mfrYaQQBtMZhoklgOQb2YBDhmSzmTfcg4oYdqBkr6nqo7IFHauldw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGZBNpRJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A834F606A32A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 08:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A834F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGZBNpRJ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e90071735so288486eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 00:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794298559; cv=none;
        d=google.com; s=arc-20260327;
        b=WdvuUDypvhwQDdBKCZ7LVtK7TdSopIiOnubzhd8EsVZBc3M5fDUsg+rKeqLGAvnThT
         bB6Jvy0S7PYHualCmnoY1Sobt/A2cSAxcEBo+DPN0XzNCMtHIoHu64E3emDqaAj+zS/j
         QAkTaSMqzZJ2C/U+afx40cZ8HWAhbZGR46C8Fs2GSJ/7L1kPfqNkLuTOFYW5lBijpspJ
         XwLMpCTYFG0PX7qPSpIMP6IXF/woOiayMVvCsFBanM4Lo85Rf3vK5GMnEZi+aldNX2pX
         xe6jOsHrrzLl++GUoEILkbITuylToe3LZV1lbOnxX2vKK+kMJ8i5sOVAVRJNQeUAwnIz
         KBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Xc0/rpdCy7AH8vJ8uevr6qJbvz6HEgRC2sFXRCHrFQ=;
        fh=j05LJluMcTEU9rqactIkOCacTCu7lo2ngAXV5u/hUVw=;
        b=rvH+oAjQAk+V64slzAr3vG9qLn4wBKU8gVtUcK9EB5aUJ6DCMRKqLkEV8P/u3uIBFR
         Vbkmzb7qEEyJINK33aOOKdyjoAXfm3FNCHCrofSjKM8QMLqJ7wfFatPSnB+SeAtVnscO
         h67IbW7fK9qawmtplf6kkLH4Pmzc0cWEm/oQMbI+Tq12O/5Uy5z4GCAA31RrEHllO7mP
         2Bci/SAAr6QZv4i2SUyG12uJUtBvpQa/IlfiPmA/bkv67sEgogGGQuLqjXFTrndBpWHj
         1R4NzSWfB8kHT7FR9rIOEJiGkk/97ivTMpd6JvUe5uFy1OthnscGzdiiofSWZCrTj6u6
         qwDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298559; x=1794903359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Xc0/rpdCy7AH8vJ8uevr6qJbvz6HEgRC2sFXRCHrFQ=;
        b=XGZBNpRJY0jnuBeXNYz1U5VVLyNMRnRa+ymN1HRDOHkdOd4JQMS2+5zKie4z3n+xvJ
         giq++xKICcPpaxiWd+sCEITYNYsvyR+bX/47Tu5dg+wniCBN6SJuQN5Lvga/5WNRd8Us
         nsuJv/7ihZQhKNuTd5lPJHKnVRa9e+DfTefIjR2+fTaTv3vaC6bEmwyebZOyIvrruLcx
         PyqY4yzIdMCw2ZFV6iaetg9QwFUCQW0YPUmX9s8493bV2eWB+4rLJ0zRXOxA/smA++8Y
         I3w7PolkN7v872su7CSmf83BaIl3jJwgguHTFQuy2n9kLt4Rf1t6T4S2XOxq0U4Sb6Au
         6rsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298559; x=1794903359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Xc0/rpdCy7AH8vJ8uevr6qJbvz6HEgRC2sFXRCHrFQ=;
        b=l7KzBFv2o7Eb6F5t3pxZY3HxPw1HEVIlgE+foenV9hVoybKbqlPlRBzKukB9OChzAN
         Kq/xmY8xAm+4Xh201kKOTEvhSz4ne6v+wOE84vCDu1qzkdDM7Z/ldTZlqh4aVSoEreKv
         OAZNerzdj6UoTMzAzy8J31MtXPm/0hAU+aG9qO8Pih0rdgBNW55U+L1eEoNo9mfM+0lZ
         Po9XOICFVuzZHG5YDIpN501wbF5+6TOpYpffBdghBdAzQhfYGNqxZEbmHWy495PSka8F
         yIiZ6cJUF1OJxVEJD2Ez5NXDJRDmriK1NPPp7J2oic6J0mtEfj5N2BmPzJtLNSGn70lR
         mzng==
X-Forwarded-Encrypted: i=1; AL+hErGuZ6QqDbOaI27sIsjWzh9KN0Am6RPfa8z3yCkOw0osAXk/TqA4fmx6pAB7RPvMUrZFO+sBnieYteV8Ryc6yw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8RZ7wtYtDi18Xns4TneB4WNdJMhSa7V86xoVpghxBkUO92rYAk
	m3nOs5F/iuT3poyky+9CBHDkI5f5Caw6hFT9+kkd2FPgW/1M++QEJsaOPnESJxh4n/JEDFds1kl
	hTFCuBF7bKTsIgijQ4W/xJACBHA4HSWM=
X-Gm-Gg: AYBFou04yECak9vFz9TD0TuW5vv3cmU857BwhhwV7L6brFd0FUlBQI2/PhqA4K5xJ++
	UKnLRLoWbeGFeqsDl9gAWnDZeSzmy9wIqjmt+P8F+kvssW4Lvwi3pqaZxR8tIenFCUzvbT3Ptkc
	nVPFdET+YgnNV1rG/EN5wZcftibrLJzXFcYtVRZLDLenqBI12ZmY9/oLVzytkfM950PCqsP/nVh
	SmUefU/NTUv4EWeARY6C1V7amwoclPygIxjayXnTjWiptA+Iv65X7oRMhKHOvIgRFJfI7nmg/wW
	t0xD7P09ahsgv2jqFf3FzKvXYIPtazRTm+7RfJW6TF9NYFA/8nZTaGOSXKH1mKs5I5v7AjjVYc6
	Upfb3ZyDxWcmC9tjNKxKEHmdsi5OOLqMxyXx6vY21e3uCi3bbW7KEY4et7+/p7OPPUUHqXnSeFk
	pd/nVd6XJF8SqcbA9G3FxjtQvygA4Z0XXjt6cCDerqnakeuKgniPEqZp1k6gUwyIk2FbfGswCZQ
	hj/tYfjM6RpdFpXEs9NrJ9SH81LYxq/Pqg=
X-Received: by 2002:a05:693c:6089:b0:35f:ea17:d171 with SMTP id
 5a478bee46e88-3751e99321fmr4325717eec.2.1794298558497; Tue, 10 Nov 2026
 00:15:58 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-time-delta-display-v2-1-b01b1fe9ff9f@kernel.org>
 <I_BPRv0XwpoRCf2AG4Ot12JnHyqvdM9lb_wF0sZMixc0UIoaBb-aeNWYuff1oe4_X1m5SpCTcZp9woOg-dt9Eg==@protonmail.internalid>
 <20261104.180854.547774168466136920.tomo@flapping.org> <8733tgnc41.fsf@t14s.mail-host-address-is-not-set>
 <20261110.075758.247487148810717068.tomo@flapping.org> <87se19qgeu.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87se19qgeu.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 09:15:46 +0100
X-Gm-Features: AclHuK_MI8rOthbRv1i5nWdpIAxbnLDNEYvOPfNdpenBYaVTmaGUwNiPwQARWQA
Message-ID: <CANiq72m4YdDbmE=M=mu=2g3pUzSXn-JRQ27TcyVhAOAwCyyJdA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: implement `Display` for `Delta`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, fujita.tomonori@gmail.com, frederic@kernel.org, 
	lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, boqun@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:07=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Good idea, I suggest you submit a patch, then general discussion can
> happen in that thread.

Yes, please!

Cheers,
Miguel
