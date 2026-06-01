Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B833612E0
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306195; cv=pass; b=N+qrtkN1wN9mWzKFP4JN/CjEllzy1Sp/GpzVr1316bQ3IRiYDdM2hkpIv3Vr264T8jIjleq3B7Hdm1K6Z8p/i2z+acue3cQI6eRSVfbkDeHsWUWXLLQuEtRopLftB4Uwv4zoR1sZYADVg2E2DiTmjMBZJaQlDg5RzLkP2baW2Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306195; c=relaxed/simple;
	bh=vzmgYrH/xoIGSOJF2VoBKhNMWBPHak++BwjBPknRZNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUbeh4Ykidk+3TXA4/PXWjCL1AWPRfR30QHdo+ohGrgWATO636YiOGawucKBPkx2nkePGkwgOkg9OryOdJ0LPChzO3+U5P3TkKqC51kpj8smOYfycz3TzfqxhZPGzrF2ihMR0kpCL3y0zvDQi3CfxlVEMjUEDfaLmF4YukL+/hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hatc6Ufs; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hatc6Ufs"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304dc707bfbso357074eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 02:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780306193; cv=none;
        d=google.com; s=arc-20240605;
        b=BXicscqETy2XcocrEvie5WhW3OIQwytxWEGX62TRg5Z+Rkmp3586sflj550OWcZJji
         12WpkRftLb//onndlIuHIa6jeiJpv3NugFn4sQBBbG7pO5liYQ1zdvdmm1W356GsFOPE
         owqaxYnv72MfKSXLfecRP3Am8I4zKZc9bbsZ57kdegs1FPIZBPz93a6B9RYievPulP8+
         mVP6K/fTiXVZa99c6bKioWSqlb0Zo55ZWKUA/nVdeQmS+J9GmsWmrvGMiqt7PPWSqA1Z
         RXAqXKrhMXwNLvCvkc6RBRjAgM034o5UVZYUj6pM55oMES2BEBYEwYWtUuIQc6fxMt0u
         ElDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vzmgYrH/xoIGSOJF2VoBKhNMWBPHak++BwjBPknRZNM=;
        fh=AmFEK33koHjC/kSqV2yjHkTQ3t4coyNtsHHHhX8EOyU=;
        b=BryxLaqVSVBQAARdinRsw4/USalOq3YlNohqZrCg4kZ5nCASZdOJ3JGCq/DCH8TpcC
         Ac29XkdFK80ohRxeAQEDROtMh5brbBnxR81vl3nIB8l/b19t9CLDV6sr+nzm6kgvSu2i
         /jVnvojST6529Lj8RGBPMfAEFzqq7p0DW333WA1RNNqmpPQ9AxMgl7srQcfy69WkmOn/
         fIawgwJ6CAFHaIFj0vOI27dvZ6gFyscCQwW84TPqmxET8kHtQABukYQ+DAPVDOgjdpbY
         teCMTzsesho6PKMSOfFHX3qnmHmQd56ts0KbBiAzzwuogz8BNZkImWI8rTf2LJvlcEw5
         6+5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780306193; x=1780910993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzmgYrH/xoIGSOJF2VoBKhNMWBPHak++BwjBPknRZNM=;
        b=Hatc6UfsIcjyBL+5xNRg52HiRr/00LIRDlEPa9zELl87bix8AcS1Y0DVMSQ5RpGLQj
         PjOErTITxmg/IfPJDKuzjn590G7kQeWpsZdyVxNGQ2cAgUxigRnY33djDr1O2HAohXr6
         0eaM6Ip8/LZRT2gP8dHV2pROa40efY6llNhVcJjkTWWpTccfKV+/yJY/lR6qVnIhTCoI
         r9r4nMWa57OkQso6KI4u6VNMbCLJJKGYXs2L+rLU3A6ICygzgMt5rpHeTbrhgYn1RjOP
         /Dbpbn2Q0hn+kt+GZU0cS8wDwZn4oQGgPF8OODeZetgEfKTDqPr1rkMZDc+Gcsa1nWGn
         lznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306193; x=1780910993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzmgYrH/xoIGSOJF2VoBKhNMWBPHak++BwjBPknRZNM=;
        b=s5PMkPwNxPQ60g810F0CEHA68B8uYa8XO16cC1YtWwzlf5QR/r53FXQ2jZU4E9Esu3
         DgZVgxKcfJUaKmFnsua0dkcNSQv3dp5QH1wbk1Yye2x5JI2vTGLZH/LRxfR5ciP0YIl1
         8+b0xNSGYjyI+BtVuUAE3ogyb0mxSwgzyhUMbdMxFFucip+EBY+MPTemH5TmeZkMQzmL
         j9McPGlhDOY4PtqFtar2jTTi3FwLkUf+CUBBYsRDcH82jVoQ328gtSYfuhu/P5bOrVq0
         aAtfjOq9owjQOjybc8EG1ywvltNjGx1MnJtmdUFgLJprqaT87b07XztpviAdlGAoj/7e
         HYnQ==
X-Forwarded-Encrypted: i=1; AFNElJ96GBcuPbl44ISDis12jAlLm8xMZO4hyrMDm7Ztimxq+hBBk98Hh9hzy89zyIvgrNn5EsLRW+K972V44SsrrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBN4VcSsNVt1RDsrKmpvJ4BMaoLOj0m31LNw7QwcwEMj2nKCWU
	S8xLcw8enn3rFUR8/HLtV04cN63ETYKXj0dvxCrX2tUjCYGB9vSRCp/iGkMQN7Ov867BHDXCjys
	5VxmiyRPi93O0m+igujoFmzCUQUSIl8I=
X-Gm-Gg: Acq92OGnLtMSRhChjYN9gqPkMPr/YxLXRvRjkqwiK4unGTwO2EA0j/VPMHR3jzbXKeX
	BAH3Ml1C0hKwKowalOuYfRCWfWteOtpegW/0J+FFwGwAmENZ/2PsGa3AS0tsuKDHqDHlOUM8LoK
	NnRsDyDc7/q9K5TVYP/DeYcvYMfIq2O9Y/tDNAZH+Mjn7d4mSfKLYBOcTqGIfVMQFPVG4LWgVEl
	ucrx1RF48oUHSblEXmmHVdseE2DOCK9uH4Wn9orKbFZDokfYgireRSB5GnavXzyixX28WrFDWk0
	fGEgGWJUPr9GJoROGwmgEmt/sqSudLwqbBTFaywDhWOKhXWc8NplNdKp4MyhaAC6+wBdY5eolKR
	zwW7F206ZYjKYKdMGl7l8d+hETfHLTQduiQ==
X-Received: by 2002:a05:693c:2c86:b0:304:f860:3ae3 with SMTP id
 5a478bee46e88-304fa49e500mr2410100eec.1.1780306193421; Mon, 01 Jun 2026
 02:29:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528062810.256212-1-work@onurozkan.dev> <20260528062810.256212-4-work@onurozkan.dev>
 <20260528082025.44414-1-work@onurozkan.dev> <20260528083518.66203-1-work@onurozkan.dev>
 <DIUB2DNTF6W9.2BT1NF6UXUOFI@garyguo.net> <b4f6d3e8-3a08-409e-89ae-ba5d612bae30@paulmck-laptop>
 <20260530062730.38077-1-work@onurozkan.dev> <3ef86db1-edc4-4e50-8614-2dd7270540b4@paulmck-laptop>
 <CANiq72=jVHEu5veW_k9B66avYgVR2aHDN2QmDny=j4EK2uRXbw@mail.gmail.com> <20260531191107.35357-1-work@onurozkan.dev>
In-Reply-To: <20260531191107.35357-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 11:29:40 +0200
X-Gm-Features: AVHnY4KMlWZQ5dbcCfvIubv8U6IPy9fVqBTgRvMlZMsUSNcKgbQp1EdWOYSjF0U
Message-ID: <CANiq72mdeiG79tS4=xbCzHT-n5ZDTB5_QKwhF3Z=XeuWkr8BXw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] rust: sync: add SRCU abstraction
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: paulmck@kernel.org, Gary Guo <gary@garyguo.net>, rcu@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, 
	fujita.tomonori@gmail.com, tamird@kernel.org, jiangshanlai@gmail.com, 
	josh@joshtriplett.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 11:17=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> I am waiting for the v9 [1] reviews. If we get a complain on the current
> approach we can consider the Rust-specific clean-up C function +
> disallowed_methods from Clippy.

Just to clarify, I only meant to reply to Paul about linting in Rust
in general, i.e. I didn't mean to ask for a particular approach here.

Cheers,
Miguel
