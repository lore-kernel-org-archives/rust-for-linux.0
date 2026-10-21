Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574836;
	b=EsJesT24Lfn4/RGDnMG79wzvBpvQE8tJVSPsLuxsDhVVjbF70k2WFwjmzp+W84Wgk2wO
	 na6oNSEwr3JUfufYbcZQw9hSUYBWFR3YiyP787QY7qsw8qFQ3qFUEU3XqXW3Bgfi2YA/J
	 FLh7urUItEoT6sF72hSYHRlURQlGCdp3SuBH5oroVsO4weiLzY6N0cJFSY5qcKP9qc+Fl
	 qTyo+R0hYWDkZPsxHQh0fOPPCHSSSX1PROCyJgDEWxhOpqfx0Bza6+0Kx6sbxJ0C1CiGT
	 ha9HK2/U7RptljDybtlyil7sQyDVTJaqpVS10zqhclESBmbhia+hW0VcJVSn9AkozkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3WktpqJ5RyI3CKZt5Qq1knYJO00EeIPHV/UWKkNJ8JI=;
	b=Lt5ayibgq5oFy2m25RoVhDrUm+wYv44HsMrT52nYoUo4hG/ehfoPfw1tRWX9DNo/Y6Ka
	 63R8LeC7ZjPyiRAEhG8UnbPyT0jCUJljsmzFqpzA3vzC2azeUJmzu/LVWwN6L+z8oraBs
	 OSxtwmxCNCqIzM/Gxc+1KTlDcs4d1kogGoIivFPa0lX9yWCxhRo01FvkQ3qx1hhmCZwuT
	 ed9vVnMV0hUKlVoFp+uLWgUgFj9WKIEYG4UdhN7ROplHqKP6id+0E2amunyFBc1zZ1CHg
	 UMAlIUb2ywFr6jhLqKdIN7TdjN+wfpXXzyFOYLl9QQLkHlpxHws1/YmXlTMkhQB7VWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PX1iIRSZ;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B472606A32E
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B472606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PX1iIRSZ
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c5358fc28so474084f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792574835; x=1793179635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WktpqJ5RyI3CKZt5Qq1knYJO00EeIPHV/UWKkNJ8JI=;
        b=PX1iIRSZQXCtB96QC8suLk+nFEe8bodK5DE6nL2TtwDz7P2T7urPdwTpV9WeNwoXqD
         5fL/SWRAxLQfKr9IAbHmqw2VM1CZv+FvQodjCQrmi6XQpz3RdLeh0XQT71eA1EvI6IhW
         qr7lTrQmdCrfJKhDFLJsPABBEnNLoU/r2Jx9TCA7/kNqbchIFHqyDy5yzwAoE3zWniok
         VNzJ6V5ok/BWuhe9xeVqgSL/OaRi5CiP8GfwUNShdLOA4zZciqJYN5Dk65OUJ3j8XMsG
         aZrtRijXVpCsFLlYO/Hg0rR6NgY0Fim8nKO+PmDJ4kVcvCwxzJmzbuTWtx5M1LrbTJcu
         ZTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574835; x=1793179635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WktpqJ5RyI3CKZt5Qq1knYJO00EeIPHV/UWKkNJ8JI=;
        b=c9EILIUAtKWcuOejMobdeZ4W7EwF2TInkLCl7hNHmoByxuZfLHgCnLKW9lKO401yWh
         gK6W9lvApRF4oNJrzH4CB6Inrk1fNo9t4Y3PRKuB0Wz04+LyF4YsM8P+aP2tKg9F9dYv
         hAHRGemPO92nZQe5esTfh1KKT7id1PTLRLi82TAoiwiLHfQLWuvKf+9mTCt0aKD5hLMt
         ch+p/FjKygzGsx2CCXNis09dFwzBg12BqlnSCo3X7PW+Czc4Co1eo0pOslM3TNNPSZRV
         MXwOT6DzEdc2PNO1HYxH874IftfANp2BdTplgTWqGYG1q0SQtIQukJT+zq1mQfoObTIV
         tzUQ==
X-Forwarded-Encrypted: i=1; AKwUvBymh73JkzRwep9Wl2Yem05YmZQ6UA/lDFajhqL5nqNFJUdP0SyHJNkoeWmeLce/Tr68kNRZ7yAvJgLMP87FjQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKEzFWk/wcqO77tw9C8oB/lkKm9YHk2OsLTfVF+gix9ebJ1IkI3
	zy4MxMCkbyv5flSejKgRd+7/pY5ksR8C2JU7FR0/faitstmltzjQI4RSuO6w5y1yvT0=
X-Gm-Gg: AYBFou30Z/KR+/QMrHEE1O/dIHO6jyE/C+JGI0BUJ4oPDj4Ptnf94puncj9Xo0liB8+
	u00slm+KUtrU94hKh6V4yaj7Soce2+Arm7moO0CtqrYfDfDHo+MhjNLp4oUM3kynKPVxj0PrYag
	j+V+P1MgoyXeqTvWrPGSLXGxLQjQSudBsTgl8lZ0+lczU85aw/0qh82qrK8eozQcXrgFxGyDDTZ
	115+aNqtxEHV/t2vKqsDeLPNnd6jMIsAwAkrXPQH7kD+0WnFHUi+8XCZiz0rte4k2rRLAuo89K1
	MHrFxv4iN80K/WjVH+I+25ivaeWWn00BuIG28ih2ifyGwnPHr5eDcIzuSpdOxTe6KiHQrwYzQFL
	HJ9fIPXr/Ew0boqwDj432sMxFvchDQqc7pcmx4koI/EnrS//Mn89T5iN27PdSSKLh+mKZx/fJC8
	vlzGG0Thh/mOmBH+tlv7tFa8hbKRUZ9kSN4UXU0r+VeRL9B7Fkqi5f/ngqTm1BSMcBurSje+3jM
	DAwYQxZvxzd5uDN//jG8fyPwEifMO6AqQVa0egffgsAuK+8gY6umclHuyWHPEI+dTPsdIFujNDY
	haNYovt2kci5aQ5B
X-Received: by 2002:a05:6000:400e:b0:48e:b62:d134 with SMTP id ffacd0b85a97d-48e2642cde6mr3031305f8f.6.1792574834481;
        Wed, 21 Oct 2026 02:27:14 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25b04883sm4370211f8f.0.2026.10.21.02.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:27:14 -0700 (PDT)
Message-ID: <0736f8a2-4f02-486a-9552-dfec74032fad@suse.com>
Date: Wed, 21 Oct 2026 11:27:13 +0200
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: exports: emit ___EXPORT_SYMBOL without C
 declarations
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Giuliano Procida <gprocida@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>
References: <20261019151243.1595858-1-gprocida@google.com>
 <CANiq72nqq4oGBWVtSMBhXS6G4H7fYg07ysD7SjnOWWt7R9_ajw@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72nqq4oGBWVtSMBhXS6G4H7fYg07ysD7SjnOWWt7R9_ajw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/20/26 9:22 PM, Miguel Ojeda wrote:
> On Mon, Oct 19, 2026 at 5:13 PM Giuliano Procida <gprocida@google.com> wrote:
>>
>> This change defines `EXPORT_SYMBOL_RUST_GPL(sym)` using
>> `___EXPORT_SYMBOL` directly:
>>
>>         asm(__stringify(___EXPORT_SYMBOL(sym, "GPL", "")))
>>
>> matching the `__ASSEMBLY__` path in `include/linux/export.h`.
> 
> Hmm... It says it matches the `__ASSEMBLY__` path, but it matches the
> `#else` path, no?
> 
> Cc'ing the `RUST` entry and modules too.
> 
> In addition, I wonder if we should avoid hardcoding the particular
> form of that `asm(...` and instead expose it from the C header. That
> way we avoid repetition and getting it out-of-sync -- that was part of
> the original reasoning.

It should be also ok to move EXPORT_SYMBOL_RUST_GPL() directly into
include/linux/export.h.

-- Petr
