Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575760;
	b=t5qzhhqKhm9omk/EEvcHnGatJG0xQyAEDZGpY7O0mC94pjOWnnlOXbOMnIcszRgvlaDb
	 gdjODDILZ2bb33sEXuy0hjIC8Pnu35w021xwELYf3A1Tlvan/R4gTDCv1agF4bt3GrK9S
	 7S0MxGmB3G+TvaPdORimkWNmYMajcH6AJoqMKc5uV8M+sBxbgF8M548ETUKJ0oprf60ml
	 4aRfx9sET4WagfSeDYy2i1dPKbj43Xf4p4Kkyxx1TQDwVmNB8RDRVMYGx8JeTQmDJOGEy
	 Vltu2cYJboADS56zV8h1aaEvkrLhMg+GQmRokEFX/Jv+bes+RhIYH3JoStCjQU+RO/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Mj+S0OCJmwZBCexwj1UBIiBIBoUjlZPG6A8NDn0wRDc=;
	b=vIHis44cb5+GsxG58L1fsYaA1ilH00VBPT2YNPKkyZHj4LI8JQ6hmIXnqB02UdtZsdxH
	 +LiU/f8E4frfAvN/qwBKE3HamOQmlM7eiu5LGwwvbNw+P1wtLALyIxwC9p/1VvUy3Zo0Q
	 HnV5ApSniE8w/11eq0SI6e4ZkgHlOLq6uBGoBAifC83lh28oPZGhKjWEwQu/oUoIQSprn
	 n/D1w8AD9vT8GujahqSIpWrkm6UDkw5hr8W0A8SWW8yBM8aiJdhMmXRqOG+DjUwy5z/ef
	 f3aroK91s+cKOIvEMM5bTH6O9Pj5sWYc/QEpwzw0nBlwTEG+uOHeIyOohVSjPRTM8/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCd2zNLG;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E8606A321
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 03:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCd2zNLG
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2646225a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 19:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575759; x=1796180559; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mj+S0OCJmwZBCexwj1UBIiBIBoUjlZPG6A8NDn0wRDc=;
        b=tCd2zNLGnXe27TOvg3Nsz35+Byxb+vmFt56s3OM1ujZaghvtCNHHsRIR3YgL2f76Gt
         qRAgSe7g8RVRytFGdJzCrBNQxJ9z9387sYot4IQUEAfqw9ixE9QBj6S+YbDQ+jLlEChY
         EMCGu6AK8SSZ/uNPZB96MBlT+/8o9Yt0SzlYEs7UL4+eB2bhnPJKt4obwaYlAZO5HkEr
         F4L9ZaayyXlejIj4ERqBQ9zZatOaT68JRM5VT5r0oRY4awazV3OAZqH7i4Kb5jbNkqan
         4eP76rCcqG1qt6TMRnhsJ31kg35lPbxjP9t0zzeSpX0k0AJBn6hDJGu1BhCvexrkE1Hd
         fsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575759; x=1796180559;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mj+S0OCJmwZBCexwj1UBIiBIBoUjlZPG6A8NDn0wRDc=;
        b=0wgO/Eg7dUn06ivb44ZdW27JTXWMjCdVtA3QjKPTLrIJHrtTEBA/g9HIonrGWWP7JD
         MdHGy9yNdbK60FsPvQAEG3I9K0/5+3gpQnqL0E9a3nBxfbG/H9XKOomI9d51wb6mkvR8
         YywispUeRmZ87nUPiBVTmmxdk2Z+cU/IgivwT2kl3NEdYghz05uBN7/Op1MKjSXgMq/2
         yYnS+goQtyBL3yNFK0nRmgIuXgTxIvKJWzha/NiQLeuISQlG8umipTtphHBMBiad4qXL
         BMr1Ee3cgiWF+Xdanjvtl5AI8AmBy+xeU30lPKnY/n02HP0p1xQhW8EKkAIpJSDyhNp+
         tblA==
X-Forwarded-Encrypted: i=1; AL+hErGWLUY98XG0XRtU1+2SmVn8pHanNy2DSJZA+Ewl/La+v8GDBQfhwTo3DEby3ftTiy3lo5DDDqxogXFnWdiiqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9NK72vwI97E634I87kZFBRDF0KIe/MO2BgH+4htFp5iDBj4QfV
	SUtmgwkZTov8orLOpt0byV7ybAFRQYBM5kvx/aoInmUGCySGEKHt6z/Q
X-Gm-Gg: AZFdTZeP5XSnizrI/+o9A6DpEJ3+XeSDfnA//cW/ivZ4x8RMHkulag98LAKmmsq1Sp/
	LzeTps4aN7p8bnyOjI3bwK6xy15mSF+d5I9LT2lSS2F0EHdsx0cBObt+wSGTSxXGvvdVgm/tRv+
	XDgBWD2czQt4yoVq5MGT0QG/9/wetPNlIa+JSlnk1xN4wWXy8rZi4K9m8ZR4L1xZr0eeEgWgjMA
	g+wVWRShhcltQKnKeiff7yNjML+2YB23GP7BsvUT83ESkH24ZU/Y6k/SDI3YHMIP6HVaZRnAFvL
	lvX7kmiA4WA4NQ9iNcmNQObDQdRSaSeSQbrjKjIEKoYIE9v3RjC5EJDOEnL83JjkS4L2z/PI+7Q
	fBaQ8drFiaS4sF2tFT94u5ASDIookM1WqYUrlSMtK+1m0glPfEt5Eae94zghvDBvknMtVu2dS8Z
	UaRuCPK5tQAJFybmBkOeLB6YecF1+QTaYTcl7njUK3/uVUAkBMWupHmP5uX3pGD6M4ICu9omdFG
	IfjYiKYoxpUddqwHRoIEPhUcjapt2JAAhZD1MhsUYjGSrzSPCn+qivfprdOLvLwvcbwse5nFaYc
	Bt484nxUyW2hciDaFXxDVS1e3lCXo5mmpB/eymcX2eXQOp3PyCNXgGv62c3BBJt0VdmYaTO8HhN
	H3RaxpL7P1h5UC+b9LZDQtR0uooe+ayQ1PD1GsikudcnstiM/XrsbazM=
X-Received: by 2002:a17:90b:4ad0:b0:3b3:cae0:2b68 with SMTP id 98e67ed59e1d1-3b41c95e7cbmr16230428a91.48.1795575758907;
        Tue, 24 Nov 2026 19:02:38 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm24999098a91.0.2026.11.24.19.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 19:02:38 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 03:02:37 +0000
Message-Id: <DN3YHFL4G7NM.36YOROLVGCSN3@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] selftests/bpf: Fix kallsyms parsing with long Rust
 symbols
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
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
In-Reply-To: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
References: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
Content-Transfer-Encoding: 8bit
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 03:33 PM Ricardo B. Marlière (SUSE) <ricardo@marliere.net> wrote:
> -	char func[256], buf[256];
> +	char func[512], buf[1024];

can we drop buf ?

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index e871a26..06f6553 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -64,7 +64,7 @@ void free_kallsyms_local(struct ksyms *ksyms)
 static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
 {
 	FILE *f;
-	char func[256], buf[256];
+	char func[512];
 	char symbol;
 	void *addr;
 	int ret;
@@ -80,9 +80,7 @@ static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
 		return NULL;
 	}
 
-	while (fgets(buf, sizeof(buf), f)) {
-		if (sscanf(buf, "%p %c %s", &addr, &symbol, func) != 3)
-			break;
+	while (fscanf(f, "%p %c %511s%*[^\n]\n", &addr, &symbol, func) == 3) {
 		if (!addr)
 			continue;
 

pw-bot: cr
