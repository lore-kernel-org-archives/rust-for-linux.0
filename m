Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0164492E22
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941727; cv=none; b=ns/zw11OhuwLH1pHgrL2VPqQH3khR2sPjS7K2Btbnp+L/7olto6M8f+QJka106dzyTxNfSYmTjQG3v5fhEE1NMUaMc+FIWaIGXjaSM2qxRd7K7p5fl8Bnv/P2KJovVPlLUv0khuFGaK60uE/PTrwNlNJRDFSYpg3+y3N0jS6Z+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941727; c=relaxed/simple;
	bh=gAY+ry7XQppx5kZcg+BfzcVwDqxF38v68qrWhv2EpEU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=Ih71oMVe+75p+RnhqpJpNqxosieULtrQ6xIDh+rZQrwct7UDpjO+MknXIljueeJPFMW/kNzHnBJdKzvsjdPJDIxF0QVEGDdkoDJFvpOcL1djiaPio6xJ7fzawyd3CgNL0G8MV9zgcHGEGyTCcXtjTnHr7T8VV/39R66o6o4RGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeyZIhmU; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeyZIhmU"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc7e7717675so1207843a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 04:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790941724; x=1791546524; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDgCZ93FbbC+h+9QAZpC0c3CaTDV4NHqwfDJ+8l3w7I=;
        b=MeyZIhmU8tcw6SYtV+1UZ7tSerG+sxuHQGu95Sf+jXbAr1jEANi1Xr2UvlE2O8dFCC
         Kz4XzfQuSc3KIwWpsVO1Wp9OmjeYf+k2zVFqFV8MrniXv/Iv8UCfKoVfgmpUA3BuiRNo
         E09LSomNq7IqB2WCn+1NYu8sFOkvU0Cu6beoCzkTV3AHfDKdEtalVaFOtKnZkVt+FvBt
         TdkVI6itaXRa85ogpErUJnSIghBnEdXTd3G62zvw8C3M2iygDKn2y0J1J0hsAnGP9hT8
         3SVS+eFmQ2NIyY/3qTsvtmqitlyjb/IelUbO2q1DHTFsAfgRgFm+mHLNtvYT7EJfslZ4
         pFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941724; x=1791546524;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDgCZ93FbbC+h+9QAZpC0c3CaTDV4NHqwfDJ+8l3w7I=;
        b=G9PKofIBM/n1PLIfxBjUZqJt+do93SsycZQDXkcaGgOXHsCWPbA6U1hoUk9MrGZVwV
         LPuXmx0S71wD/cqfmxThkQBU0BfKZ6CBUUJr934L6vOC/iKJRQxGj3oIuGpW1On4F12Y
         RrVN4Wyj+SZgS4ZZzM+83dlWO7/9w/PFb9seC7t7lNXKeClIp8a1rYoaEhNvs3/1xZdF
         XyNiFzBoQjegH343Bzm0EjUdamhVIL/9UaiasWjgy+ArbOu9kZRUPw6tfE5iE+6KQ5wp
         lmNVcBcdp1H+1SdxnusqpPC+qqD2QehoZmcGkSJl8tY3Aa+r3q7Gh92rQiHE6MRKrg5R
         mgJA==
X-Forwarded-Encrypted: i=1; AKwUvBxEgjl+5O3/qIbmsuXNtC4vSEzEGvTFBdG/dAbp1d9VwcJa5xj0k7pvRjxCs+TQzOy1RB84mXqZLSIx7AyqiA==@vger.kernel.org
X-Gm-Message-State: AFuF++kkCgM4oKycAtDi+ZpzDABGMfzJcyIsGTU7trKeX8cH+uV3ZJZl
	kibaT7RjGD4ry4pzmCa4/E/43YFyNJKnPSF9Uc3B5fxxjj/Pd+bVwTh3
X-Gm-Gg: AYBFou0ve0JRwWc8QbdeSxS+7u2ldGTSfwhtx1N2CRDFIlS9nfS52FgFufVGvBSdz0B
	v1/s+RZTnxQI1ao4UXV60RaVDzgYxL9F4XITnxX/IQpu7mTtH/Ft6adj12XLXHmicxsFRXVNWMe
	KQPt8pZaQq/twp21OUrQT6dChT5gGetNbrp9LfIJIHfU9pZ2kWJP1u3YtSazS+aZiG1TZ4nJWJl
	xnQX+FcgLKgeGlIV6gPRjF6+Vcrp6N5WvnyCdm1/jy0CfaYLeqeGDSNIZmBpdzFnm1d5xW4R2bN
	XwR+Pb5jLyadzN7rEDr3+p2AJ1+Y1jmIFQusqneonl78wLVe2efgABfiAb/ovGsbsF9TwQs7/uc
	GwuA+uNNWQJLgpVKFSUiUL9CI22LNb04tJeYmE/onDCFuPPinY7duZxGEN1iSohtVJKmMXopeib
	w3LrMVEYlReK2t0xeBLisWz5c+CWPiw5Jln0Zeapq9qHB60VSIG5FqZAM1ckUll7S+wFcHT8Uwj
	KVYlArakwyy0lkS+24YS+HLPSWUQF5NHBcFawwSMh4N2+XW6LVLXdf14oDS6YYSYI8ST6yz0JYe
	+fw=
X-Received: by 2002:a05:6300:210a:b0:3e0:b937:8844 with SMTP id adf61e73a8af0-3e0bd199342mr2548048637.44.1790941723843;
        Fri, 02 Oct 2026 04:48:43 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d247dbcsm743396b3a.55.2026.10.02.04.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:48:43 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:48:42 +0000
Message-Id: <DLUBUT40BBOG.1L6QS7A8CIE79@gmail.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Quentin Monnet" <qmo@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "Christian
 Heusel" <christian@heusel.eu>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Petr Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen"
 <samitolvanen@google.com>, <linux-modules@vger.kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, "Arnaldo Carvalho de Melo"
 <acme@kernel.org>, "Namhyung Kim" <namhyung@kernel.org>, "Ian Rogers"
 <irogers@google.com>, <linux-perf-users@vger.kernel.org>, "Jiri Kosina"
 <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>,
 <linux-input@vger.kernel.org>, "Tejun Heo" <tj@kernel.org>, "David Vernet"
 <void@manifault.com>, "Andrea Righi" <arighi@nvidia.com>, "Changwoo Min"
 <changwoo@igalia.com>, <sched-ext@lists.linux.dev>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Hazem Mohamed Abuelfotoh"
 <abuehaze@amazon.com>, "Bjoern Doebel" <doebel@amazon.de>, "Martin Pohlack"
 <mpohlack@amazon.de>, <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next v4 04/12] bpf: take the vmlinux BTF from the
 btf_vmlinux module
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20261001225214.12351-5-wanjay@amazon.com>
References: <20261001225214.12351-1-wanjay@amazon.com> <20261001225214.12351-5-wanjay@amazon.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Oct 01, 2026 at 10:52 PM Jay Wang <wanjay@amazon.com> wrote:
> +	err = __sys_bpf(cmd, USER_BPFPTR(uattr), size, USER_BPFPTR(uattr_common), size_common);
> +	if (IS_MODULE(CONFIG_DEBUG_INFO_BTF) && err < 0 && bpf_btf_vmlinux_retry(cmd, misses))
> +		err = __sys_bpf(cmd, USER_BPFPTR(uattr), size, USER_BPFPTR(uattr_common),
> +				size_common);

Running the command twice when it failed and a global counter moved
is not going to fly.
Missing BTF is not always an error.
With =m and BTF not loaded yet take
  int prog(struct xdp_md *ctx)
with func_info. That is everything libbpf loads.
do_check_common() calls btf_prepare_func_args(env, 0).
find_canonical_prog_ctx_type() returns NULL, btf_is_prog_ctx_type()
returns false, the arg becomes ARG_PTR_TO_MEM and
func_info_aux[0].unreliable is set.
The prog loads. err == 0. No retry.
From then on freplace of that prog fails with
"Cannot replace static functions" and fentry/fexit see its args
as scalars, even after BTF is loaded.
With =y both work.

That is the only reason why "a socket filter does not load it".
In v3 such prog loaded BTF.
systemd built with BPF_FRAMEWORK loads
  int sd_bind4(struct bpf_sock_addr *ctx)
from manager_setup_cgroup() at every boot.

The result of the verification cannot depend on who touched BTF first.

bpf-ci is right too. The first run writes into uattr.

It's starting to feel that this is dead end.
So much complexity to save few Mbyte.

pw-bot: cr
