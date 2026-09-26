Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2D73A382B
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411357; cv=none; b=YwxQt4NiZoQvJ6zafpjsIJVTGm6Vjvp0QNCE0IyMFt0ezDGXL4fr81IXUturfm8UXuiXLq9z8h6DIXV68yEt6bKiXuNEmfgYX95CCi+W+NUK/jP67J3X4CtNNiGMCjAQQJ74MTLpGkMYIvdwle/4CCRGpGmK5ojwkCvLTLo2mZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411357; c=relaxed/simple;
	bh=iXM6dXLVZyc4/2LLEhMvfVIyG+SHsbmujZvmS7fw1aA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version; b=Imp5tjLc+w27YzvUUurFqeiQhVNxN8hnpMbJMaiRrnRn2ddABh9GlFk84aUpO45NoMUFbziI0pgnoY2jUu08KwT1k8E1M630K50cJErKqc+jUlvg6ko6Ar+Ciq8tRCu2qWLbt1ipe9zgFaHqVNULPFuMuejpDFuAnrPZob8pUv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1tf1epb; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1tf1epb"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1064201a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790411355; x=1791016155; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vsTzuV1eSC7imODMsDAQHQQbWFGBD/RBt6ggI0+EwhA=;
        b=L1tf1epbkhLphZ2Julis/OkRu7jj8hETfwJ/ktaJBK1t/FnSaBM+B/Cvk8BtSprulN
         LiTnhae7M11zRQ6WNQLA4WD/vdDuj9nRTm6pOICKA34Y+2mvG7lEMPdf/57cRfUjmJX6
         P2rasuRcLzwNc44BxJt5lq3cNRMHqcft+eB5yHVdTfE7PNWyZGhs+3HMjk3kIg6caRpT
         TGpyYMVH9ya+B8q+vDF7MM77tQM3OGKVyRiQA+4au42hbq6b0SM1/zlrAQ79jDv9k19r
         Vbp/FjUWRznjhLnpVPM25BQ9x8aTAA+8zE8wL6H5I/RceUNK4KJzisdkbOMQL49P0+7b
         o8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790411355; x=1791016155;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsTzuV1eSC7imODMsDAQHQQbWFGBD/RBt6ggI0+EwhA=;
        b=0bthOJvBn3UJM7A2IUzQ35muaF/DW7cGTVOVVR7RFY+BLtq5++4T/0nr2MAlNI8OLb
         12Ay4wmt8kIBeWzuhllf13D7X6Km1dOw+/4KXjSOebjjaLAfdeT1fEK9QAhqWqlWE6qK
         fByVBlG5vLiAUCmNytP4IDDu+IX9JqdQGYjMhYu1mWYSUH/w1j43dgmIpmynu6FuYuX+
         NMoD7mf5bhKvs0VrMESgsO0hsU3w238p0iu6BB6XUkj3nGhTtlSc+2zq6zSOATZp/rur
         FkqwdyX5ciQAKTPLAgEZ3cy9GLSjoGuEb5sR0VmzNggIOSs80E+nZiM+ifxL/TlQ1JMO
         IyAQ==
X-Forwarded-Encrypted: i=1; AKwUvByrR/lA33T/avZqiazmBMRKlXUgA8Gm2GrufD56G9hix07HwlXEoapKjvXMReSXT+JAvT45bB+xtYAH15TU6Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDV7tEzVzTdMjru6qld/7a707HtHIyNnrWQIBoHGnbOvDc2DeB
	Lf30GWWZztI9Gf8dzAbAh90+aF5qhjZRL+q32Mrj/r/+Tu3WiPsAujwf
X-Gm-Gg: AYBFou0e44s5MrDONAkN61zpyDH37xCV1+i3iB8WnasR05wsbLBOY+VYW8r1R/rWGXn
	457KwFiTbNAtqjelhLTq9OzLTmPEd1rjjQRD6aIX4sUksJL1E2NGlk0xdMLs+K0wffZ6RKAv84Y
	TJSaXRN6kj3yXwJ+zmy7dNWMLLzv8Gg3RU/8/0s63YvKViw+LDwpFGIV2fi710OIfVnsfp8HZBG
	Za0ZrLPHxS3x3ztJiRu2vE4mpoer0qqkpAIdr40FGLLo1XKooaKck6LWJA0hmvLSImPPHmACLJQ
	2zOSopGnoRYQ7mMOgFI2bU6ZdjPpykm/44XXVUwjZL0YSQnPfXYV82CK8M3fX88g65Anmr7cDgK
	tB8OhgYmT+4MJ1KXusH0RgcRd7cpxK12GNROuba+cEel5HMeWsMdfNIznGy/LgQRw4oOjgYWL/x
	JswSnwDejRa7DxPhjfNqFMz//wHA2u5HgqD0S8UhweHuNVM8idwSOKUQTVoE0RWuKlGj8olvdzg
	iJZbtkdAe5gVcUKkdH8PkvaiRFEO5+CDGcgRk9Gh3diV4xHRylGwtqaM03cXtHfsce/Ygj9CSrU
	RBHS
X-Received: by 2002:a17:90b:51c1:b0:39e:1692:34bc with SMTP id 98e67ed59e1d1-3a098ad4cd1mr6277315a91.1.1790411355026;
        Sat, 26 Sep 2026 01:29:15 -0700 (PDT)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm8692077a91.16.2026.09.26.01.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 01:29:13 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 08:29:12 +0000
Message-Id: <DLP3USQDIMJG.1FUZXEXOX38TR@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, <linux-modules@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, <linux-kernel@vger.kernel.org>, "Hazem Mohamed
 Abuelfotoh" <abuehaze@amazon.com>, "Bjoern Doebel" <doebel@amazon.de>,
 "Martin Pohlack" <mpohlack@amazon.de>, <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next v3 4/9] bpf: take the vmlinux BTF from the
 btf_vmlinux module
In-Reply-To: <20260925224229.1850-5-wanjay@amazon.com>
References: <20260925224229.1850-1-wanjay@amazon.com> <20260925224229.1850-5-wanjay@amazon.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Sep 25, 2026 at 10:42 PM Jay Wang <wanjay@amazon.com> wrote:
> +	if (!data && load) {
> +		/*
> +		 * The module notifier installs the BTF before init_module()
> +		 * returns, so it is either there after this or the module is
> +		 * not available (yet).  Not cached: a later call retries,
> +		 * e.g. once the module becomes reachable on the root fs.
> +		 */
> +		request_module("btf_vmlinux");

This will deadlock.
event_btf_ids_read() calls btf_get_module_btf(NULL) with event_mutex
held. With =m and BTF not loaded yet
  cat /sys/kernel/tracing/events/sched/sched_switch/btf_ids
gets here and waits for modprobe. modprobe gets to
trace_module_notify() which takes event_mutex.
lockdep doesn't see it.

print_function_args() gets here for every line of the trace,
from ftrace_dump() with irqs off too. When the module is not
installed that is one modprobe per line.

Every caller of bpf_get_btf_vmlinux() and bpf_find_btf_id() was
written for a function that doesn't wait for user space.

pw-bot: cr
