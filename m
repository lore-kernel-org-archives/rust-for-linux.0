Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563202;
	b=vfInhLl6eK+1ijHFiGkMROMkxDImI+rN8yvJ9EsFtMoIiDtK0DgugbjkWewSJpZmE5rK
	 5oS+LTVF37+XP02ll1p3VQhEN4aZJWCr2z67qko5wITPNqdkG8D31w92gVQjk7kz+es7A
	 kZrFeRVOEeOUeEUiFoGlma1RyousZZuTCs18Dat+zCXCjFWNoPvou3jO4Ooy0DMg4gAHZ
	 aA9bAB3IAbcUpRFp6OsCynvIl8fY+1TEYDsqEemMqRKKzhmxO1l1aZVutWLX5mVv4L/b4
	 IRLXQVqHu3Zq6sobBvwpLGiQdnr/EyDeme8EHZF6843ioYZDgmKSgGmfWdu3Fegs2SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563202;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Last-TLS-Session-Version;
	bh=znUf/Km11N8S85SRs50g3YtGUU6Vndbq9jw05cxqsJs=;
	b=eV2zcFKE4JdGs5S966ZW3I0EbAO+OoHxoIOtFMntzxPIpv35T+0+hdJYmH71jH0/nT5P
	 MkyK9pZuwb1c/1zM6YTWS3VuHeB7hZ/cIbpg/d8nldPlFWkEPCqIXzs8DRVP9QpKAdmgy
	 nDs34aOsm8GgmUgLl8bkEO3VfbgWiE5APPGV0ttsa3JLoZT2geGk9WgLSzYFO3zDPg0Rj
	 6kYYYZXgmZ/7rYAC6/S+IxlXzeYog3Z3nblTY3zY0Bb5ineeuJWD9KzcEDwyxmINuEJRR
	 giqJ7q2up0MS7fwuG26OuLuqVNjiH1vDo9QEjeS4BfUdewI25F0D3tCfyccVOvYZwJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=UHW72Qqv;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1061606A321
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 23:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1061606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=UHW72Qqv
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4932b13c4ccso2922670fac.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 15:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563200; x=1796168000;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znUf/Km11N8S85SRs50g3YtGUU6Vndbq9jw05cxqsJs=;
        b=vlx1IfdldFHhsxBEWcJzJ9giqLqlud6stfDCAQZAlPpgLWBhXue6kOoPM97no7oMXi
         pvcEeIgH43UD1m4qGn1EUeT2Dp65wIxa5GL+R1moxaFZsbDib0jzifQPojp1ygR5gz8R
         zIKMUi2ozCr1zvsNw9Wd/mkFAOAMXesYtrx924bWPoCr3S5EwidFVLrJLvXNLC5VmCGs
         CxdXZ2LroSo4GapOEmYOjEALWo67r0E+tvdcr40rjMXPXEN0bMfe3jHenATtGByrHnd2
         CFqkOAqGh6lj0wjp5Hxq46WPWrn1OTAGx8orFBTyziotJU6u5uzgRGsXmZyUsBIxzQH9
         VaOQ==
X-Forwarded-Encrypted: i=1; AL+hErFpEFVt6ub6dWaPxscoZzpM0wPUw/GulBVdS7lAjyGAyUiExLKIQhupANP7BTU9e77UpYnvFaHz75imcEosgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LrH4SQbLH5CZdVPbHbL3LEUrmHrq0A/fqP/IayTexUuu43rsX
	7v7M9ty8qWFmRupMTaGmK+KDVoTBPc1aNJUy8MGArovyjVAFkckER3xJ
X-Gm-Gg: AZFdTZetTqdh1FzRIwx8qigexrzmZvjOffTMm7pJSP3gz7Gbvh85+zBdeRuPhSnzs2M
	litjhjq9VZSCJhc0yNVZ4xqFg5uf6VyBTCoj+9qBpYcyQtyt+826pdHXPiWKM99dlP8vOYk9Q9E
	W6KhrevyvvGUrrGmoi4C/2lYJErRrb1nb0CwNOuxjVG1kOzOS57nVq/MSrEedcEzFsqQdRRNn/P
	reRAi8SoDzlZdfSfqhpikIcrp4aVTZ3Ewn9qBnHaLScfPnTHgYVUeq+sqiAV+93NlRRdSHDtg58
	h6tP/omNipnHY6jVnMn2jI+hpUSiif0oAWM6+D7+fdFI8ZlaYpO9dD4mskkGpdGIvsugEihG8Lz
	c7HV2E1qZ9QzWF1WuoOVpHm3jvEzuqb3sE5c2hosFrl9QPUP9AvER57lc3URZL0r38t26vQ1/wN
	w4SpYpuw8jGT6NFFbisDzJhtA/a4a88pSBrAo+4gu4Nfyl7Tfrs17899QKwa+LgA387w+83x1Zy
	LQ49/a4RzFeHyg1KN4e+s2mTOIUMYSU+JFL03aitKyzNL2G59PaD2WS8stNUTGxX8GMM8KEI01V
	Cl/Qdc7/snfO9HaOm+zmfn8gdWfykJN/RYCn0osTrLD4Uu1QOwzE7cTuUY/3/LCyIj6tN0J2Rd4
	cCfQ6KUOobJvB3GJxV5L/BuWxilKYKxg=
X-Received: by 2002:a05:6871:79b:b0:4b7:154a:7ffc with SMTP id 586e51a60fabf-4bc8492de57mr14027156fac.41.1795563200544;
        Tue, 24 Nov 2026 15:33:20 -0800 (PST)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc6108104esm14656627fac.14.2026.11.24.15.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:33:20 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C475560CD8;
	Tue, 24 Nov 2026 23:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1795563198;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=znUf/Km11N8S85SRs50g3YtGUU6Vndbq9jw05cxqsJs=;
	b=UHW72Qqv89i8lC360ZN9iNrzTXonh2+lxeevC0cbc4653xses/jwf42EMkijqoJUXFXaGo
	epuIay11vxpdKjAkOvHdYRbB+GCHR9jCSGAaFX2V4ZYhhQFRic+MPY6a7d/MTWjoyHcr6I
	HTbW5PzUzIytwODHrVs6mHKCpnB4h5Sr5ysu90Tg6oToHJAIHB94zrBvgpFuYGiIvPusAY
	odC/WWjYfcNybukoBTiJtdOVOJTBYq42YGJboYAXXxy7ddMHVRB0UEmSOSFFCDHgaf+0w3
	vIA+6a6fmAB9EXU2xRLxV/SIod98JRBkr1V+m6n6e3f4wmvmDyThBfoNEGm22A==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Tue, 24 Nov 2026 20:33:13 -0300
Subject: [PATCH] selftests/bpf: Fix kallsyms parsing with long Rust symbols
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
X-B4-Tracking: v=1; b=H4sIALgeBmsC/yWM2wrCMBAFf6Xss8EmXqD+ihTZjRsbsbHspqKU/
 ruJPs7hzCygLJEVTs0Cwq+o8ZkK2E0DfsB0YxOvhcG17mit2xvlR8isWQ1Nwcis+aKf0XBHh5b
 I4a5DKPIkHOL7Fz73f9aZ7uxzrdUHobIhweSHOpXadkTNLLCuXzrXnMSXAAAA
X-Change-ID: 20261124-selftests-bpf-rust_sym-e9b50bb2a39a
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1795563193; l=2089;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=x9GNYVTZscbVIoTr/PE54BDCgTYQJAECt+c+vWQhJWY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOBR1bPe7VWeGHtB6UzYG4XwRM8se6MCKGusMP55IX8GGt+Ah/kTWG5p2j9KUwJP3B7evtcQ/X2
 SZk1JfjltRwk=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

load_kallsyms_local_common() reads /proc/kallsyms with a 256-byte line
buffer and stops parsing at the first line sscanf() cannot handle. Since
commit b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to
512"), symbols may be up to 511 characters, and on CONFIG_RUST=y kernels
some mangled Rust symbols (e.g. drm_panic_qr helpers) overflow the buffer.
fgets() splits such a line, the remainder fails to parse and every symbol
after it is silently dropped.

As a result ksym_get_addr() returns 0 for symbols like bpf_fentry_test1 and
bpf_testmod_*, address lookups resolve to the last loaded symbol, and
bpf_get_ksyms() fails with -EINVAL. This breaks bpf_cookie, fill_link_info,
kprobe_multi_test, kprobe_multi_testmod_test, kprobe_multi_bench_attach,
tracing_multi_bench_attach and stacktrace_ips.

Size the buffers to fit KSYM_NAME_LEN symbols and bound the %s conversion
accordingly.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/selftests/bpf/trace_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index 6d7a4b8c4ab8..f8ad63c5e76f 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -64,7 +64,7 @@ void free_kallsyms_local(struct ksyms *ksyms)
 static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
 {
 	FILE *f;
-	char func[256], buf[256];
+	char func[512], buf[1024];
 	char symbol;
 	void *addr;
 	int ret;
@@ -81,7 +81,7 @@ static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
 	}
 
 	while (fgets(buf, sizeof(buf), f)) {
-		if (sscanf(buf, "%p %c %s", &addr, &symbol, func) != 3)
+		if (sscanf(buf, "%p %c %511s", &addr, &symbol, func) != 3)
 			break;
 		if (!addr)
 			continue;

---
base-commit: 475a0cfd02f14d764023e926ac01fc7597134229
change-id: 20261124-selftests-bpf-rust_sym-e9b50bb2a39a

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

