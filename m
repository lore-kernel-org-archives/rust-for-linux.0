Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604633;
	b=HGHYw7s61r6r/+7cUZ36hmvRLghyPtxbS5qEzVfVRFuqdS1RKjQtaiG71r1+IAzk2Eni
	 Fa6sS+XGa23awd4VJXMJcKuutgk+QKkesojPvCHPs92vJlZHwHljR3fj/OzgWdXi5cvVL
	 dgx/ZrBwieGCI70YQTytNadlMmqcRWwJTufYCRDSkuMGsvJsGzeIhFDt4MPVp8mxlvjOd
	 onkQNvWmhUlbVrT0MzKy7+L7gyTn3rwnS6v2ZnL3796Cb2rf78PiTuUlJ6Pjt/wEf7w2Y
	 PwqnUDWxQUDyxhi6zrQpEHecUj8MZE8HIS39TcOj5pvVDy1sgR/kDlFN6jd9yMUIG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604633;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 DKIM-Signature:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Subject:Cc:To:From:X-Mailer:References:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=mrSzuPMkqX4MWQZ1Vs04gvpO/41JB6WErbOM51m8MaU=;
	b=KvZz/YKsL65ULkg2wKHtsrSgmVPArLPyukV52jxFCJMFqnLAFLDjIqb1dPN1P/Or2jBH
	 lJ9N+d6XhsQ8bwCG1ZWwilLxngJO7wygbkjWUz40XBcj35JiiB2Tn36ta0Nn98LsFoSpd
	 r89wtMnZ8bo394npfF+eOqg1xm4P3dq7eOPrW01SPxjsvEK0PcDHEbOWrcaA1SdPGrbgi
	 psa73U7QP1t6p0HPY+MoAha5NbYwmR04qrOvnI8NVWseu9OqLsqrKwN3sa/pwqb3xNsir
	 U3ybWdfW2RZ/euYWeml5+5epJ8cmhTB9KcPSIxqFyeCs/7GZxPHgJeRCem69A4BRULg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=mVZBe53b;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1442A606A326
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 11:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1442A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=mVZBe53b
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43bf9548df4so5130022fac.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 03:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604632; x=1796209432;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mrSzuPMkqX4MWQZ1Vs04gvpO/41JB6WErbOM51m8MaU=;
        b=q0FQnhRFtz+1OCGD4igYvJZy6ovP9llpEP9U24RbpZ8O1et+l1vIZv0Vg+y9rGWcgk
         A2xUTeVFkDnZa2KvxxpZakILUcI9isdo/SRqFGMUXjn8cLvr2lOd0ik71fFF4sB22CNn
         87npcqFVn342GU7DJbYgx+SmE/MFE/1eHDyYfUAaVZvRB3aALD/62cukCexM43GDVuos
         10rAsjy0DmEf5ovsB12s2j7r1aOqeh9Wyj4PCBrDQdrLuLDJHPx87UNrJbMhU33RJtJt
         dOcd7Y+HWulheba2eqpFqfsUWhsXmuc4tFcwhfKEtzKPALDZvRUnKDHJxLrbEKurUiuG
         kq8A==
X-Forwarded-Encrypted: i=1; AL+hErHKpWRbj7hazURyJQhnR5liMeHjgCaTjsMazrQH3R7Km1Pq79RzPjEnlVFgRFu7V1V1zlun0slE7RFhbWcimw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pYdIhiGUx5bor6/c11ngjFHPTmm6gtOAPfIfpeIaI+XlZJTGx
	gW8u70j8LIlJrZwrASlXi/Dg0ojGEu4UmiB/2K1XCCJW7C7MQCpjbahf
X-Gm-Gg: AZFdTZcctc6v3FUt55HZh2szY9CxvlYcaumP2JmSiQJj41I8zdWJH2cDM8wvZqX/Rna
	o2zVwNVBABXojMxdBt3Fv2JxxWJt+w9jGv65QsWhlAgxbc+rFCHMNFEad+6prAAbdcMDUt9jaOO
	u2x3Wk/YqGTlyUYLRzeUGspjc0+NCaPGNvc/dkRVF8Nyb5BT3c23IauSKXOC7qsUp/5X1YKbMzr
	6fwv28Inigc4gX7M8hjhoxt5nfycRIqHbe3eSXrZlAtn+3QgZBsMra9niPhn68U+JgBWLyBNuDg
	8wbeo2VLquTJLYrlfu07ThhnwzJkxH6IBirsiI7C7fmkJh9jZ40xrxSu5WiBFPcr72fa7g83lN6
	4Gw65YSYtRK0ORXidUt5UrM6jaBq9gQh8yVhmSxyDpF2prZbGQn0NLpzvWqS+AGvfZmBGJN0R97
	lOjTa1JSXoyLFyN5HrU+0ZPjmwUXVimtSDomYN7TfQpArrup1AC6G7fdWUKzuIX1gSuBDdjsjHS
	JhErrZQeeu0CsiitfWAxmM3TlkdsaU7b4nEPDxYy/a/edOF2v75V/j9NII7nErubTW9VxQhztOe
	Gk6MwYNZfbKfbH0uQjp0fHIkAFl+RsLPJu/eu3zungsg4HbsWE3sRhBqJme6cjfzIfhCGruRy8L
	I5ljh4xgY8QuQh5iPF9acsumFsQsTmEQ=
X-Received: by 2002:a05:6808:3195:b0:564:5fe0:dd80 with SMTP id 5614622812f47-57a0c6b6b35mr18642000b6e.49.1795604631958;
        Wed, 25 Nov 2026 03:03:51 -0800 (PST)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35655a5bsm13720074b6e.13.2026.11.25.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:03:51 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D3B7605F4;
	Wed, 25 Nov 2026 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1795604629;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mrSzuPMkqX4MWQZ1Vs04gvpO/41JB6WErbOM51m8MaU=;
	b=mVZBe53b+1iYEz2JUxIuiNR9+Py0/uSe5+otcdgdQWU7Taf9dvO+hB3dYAycHS4mpFX58G
	vV6DZzVxJ5w8FUgTr4XqUexlvB7GaFWiW3OZc5E5vLnquW3/R7BVCiaQEAmhTwaI6KYcz+
	WKMfwezQ7cQLflxSwa/Npl0fQJVmkwKtEmDNd5aNJMCbzuVVe0ajurUaD5bCcm6NTco6Ds
	1vtjOlq9kbB/huibnDLki/qUWQ4E/tssU1ut6areHNAORl2PP6lefnfCyTkQSBxPYZQ5Pt
	HHr38vyct1t04ZK9gvI9jxbGiJLcYvYDkBcVLc91Rz0kWIqh8m/9Uy61UkQceQ==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 08:03:46 -0300
Message-Id: <DN48PTO1CTAC.3DAKV5TKHPXLJ@marliere.net>
Subject: Re: [PATCH] selftests/bpf: Fix kallsyms parsing with long Rust
 symbols
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
X-Mailer: aerc 0.22.0-17-g7220139118bb
References: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
 <DN3YHFL4G7NM.36YOROLVGCSN3@gmail.com>
In-Reply-To: <DN3YHFL4G7NM.36YOROLVGCSN3@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 25, 2026 at 12:02 AM -03, Alexei Starovoitov wrote:
> On Tue, Nov 24, 2026 at 03:33 PM Ricardo B. Marli=C3=A8re (SUSE) <ricardo=
@marliere.net> wrote:
>> -	char func[256], buf[256];
>> +	char func[512], buf[1024];
>
> can we drop buf ?

Sure, that works, thanks for the suggestion! Sent v2.

>
> diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/=
selftests/bpf/trace_helpers.c
> index e871a26..06f6553 100644
> --- a/tools/testing/selftests/bpf/trace_helpers.c
> +++ b/tools/testing/selftests/bpf/trace_helpers.c
> @@ -64,7 +64,7 @@ void free_kallsyms_local(struct ksyms *ksyms)
>  static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
>  {
>  	FILE *f;
> -	char func[256], buf[256];
> +	char func[512];
>  	char symbol;
>  	void *addr;
>  	int ret;
> @@ -80,9 +80,7 @@ static struct ksyms *load_kallsyms_local_common(ksym_cm=
p_t cmp_cb)
>  		return NULL;
>  	}
> =20
> -	while (fgets(buf, sizeof(buf), f)) {
> -		if (sscanf(buf, "%p %c %s", &addr, &symbol, func) !=3D 3)
> -			break;
> +	while (fscanf(f, "%p %c %511s%*[^\n]\n", &addr, &symbol, func) =3D=3D 3=
) {
>  		if (!addr)
>  			continue;
> =20
>
> pw-bot: cr


