Received: from mta1.migadu.com (out-252.mta1.migadu.com [95.215.58.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E07425B092
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922262; cv=none; b=BMpUzdcrBJl18DlxA/YmaqXhWnmukg71R8BoNdBLspX7ABHOLPQ5109TNS4YVmewxgZExWYZakelFnIyiGgMXLdNw+qtzWZoKduZiS/YRwtRk6x7SJQVB+VouZq7F/fRiONts6nYnC9pLHPNGf/x+tYv+xFWTgNXgyM4XrScQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922262; c=relaxed/simple;
	bh=IaKifjqocU1xSRPFTseTlb2gBR+d+jcwrU7mx/rSlOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFFljRmaro2Mwp2NtwpJrXTCY/DLcnueIZd469eq4k4CntS9C69W+VVHKHdAg9NuJI4mJ4NJN2uw3NUeWDnECbQf27Oc3aGmjjzO+o11Y7IwM1ZSkf54KPNqPG/x0T89/zZzpFkP7CUcx8xX7vbc4/bCigQe3eKhRfgZZ/v9O3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qn0yDeR+; arc=none smtp.client-ip=95.215.58.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qn0yDeR+"
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IaKifjqocU1xSRPFTseTlb2gBR+d+jcwrU7mx/rSlOk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790922256; v=1; x=1791527056;
 b=qn0yDeR+YFiEwVeUDCd2hoPiF8TrW3lGBTDqzjaSJnbkOaMtizPjTM7z52/daMkd6hxEalXX
 YJ1ouIdj31MZC/BYvDQCs6IN3IXtidVBh6wro5TU1yp7IfK9znbAtMtjth8epjyqbPD1nd4GVv/
 ah80ciyriQRE7QlF+D6QvZkA=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 00b72635893027bd;
	Fri, 02 Oct 2026 06:24:16 +0000
X-Mizu-Trace-ID: 00b72635893027bd
X-Migadu-Flow: FLOW_OUT
Message-ID: <ffd241f1-3f75-44c6-93b1-1482b7a17a5b@linux.dev>
Date: Fri, 2 Oct 2026 14:24:11 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] selftests/bpf: Use the new NMI_BITS definition
To: Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>
References: <20261001082519.16195-1-boqun@kernel.org>
 <20261001082519.16195-4-boqun@kernel.org> <ar5cbL_ywJVP9m_s@MacBook-0RXW5>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <ar5cbL_ywJVP9m_s@MacBook-0RXW5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/10/26 21:13, Boqun Feng wrote:
> On Thu, Oct 01, 2026 at 10:25:17AM +0200, Boqun Feng wrote:
>> The definition of NMI_BITS was out of sync after the introduction of
>> HAS_SEPARATE_PREEMPT_RESCHED_BITS, hence adjust it.
>>
>> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> Signed-off-by: Boqun Feng <boqun@kernel.org>
>> ---
>>  tools/testing/selftests/bpf/bpf_experimental.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
>> index 2893bf06ff25..4bf7390994bf 100644
>> --- a/tools/testing/selftests/bpf/bpf_experimental.h
>> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> 
> Per sashiko's report, seems I need the following to make it work:

Sashiko is correct.

BPF compilation context is different from kernel compilation context. It
cannot directly use
IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)) when compiling BPF
objects.

> 
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
> index 4bf7390994bf..94143cf0ab0d 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -367,6 +367,9 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgroup, const char *name__str,
>  extern int bpf_sock_read_xattr(struct socket *sock, const char *name__str,
>                                struct bpf_dynptr *value_p) __weak __ksym;
> 
> +extern bool CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS __kconfig __weak;
> +#define IS_ENABLED(cfg) (cfg)

Correct.

IS_ENABLED is unnecessary here.

The below patch passed the BPF ci [1].

[1] https://github.com/kernel-patches/bpf/pull/14197

> +
>  #define PREEMPT_BITS   8
>  #define SOFTIRQ_BITS   8
>  #define HARDIRQ_DISABLE_BITS   8
> 
> ?
> 
> [Cc Leon and Alexi]

Please cc BPF list, BPF maintainers, and me when respinning.

Thanks,
Leon

> 
> Regards,
> Boqun
> 
---

From 4c1b9a6f6404aa25d1d300465dba4bee9a139668 Mon Sep 17 00:00:00 2001
From: Boqun Feng <boqun@kernel.org>
Date: Thu, 1 Oct 2026 10:25:17 +0200
Subject: [PATCH 1/3] selftests/bpf: Use the new NMI_BITS definition

The definition of NMI_BITS was out of sync after the introduction of
HAS_SEPARATE_PREEMPT_RESCHED_BITS, hence adjust it.

Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 tools/testing/selftests/bpf/bpf_experimental.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h
b/tools/testing/selftests/bpf/bpf_experimental.h
index 2893bf06ff25..b567a48f1dce 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -367,11 +367,13 @@ extern int bpf_cgroup_read_xattr(struct cgroup
*cgroup, const char *name__str,
 extern int bpf_sock_read_xattr(struct socket *sock, const char *name__str,
 			       struct bpf_dynptr *value_p) __weak __ksym;

+extern bool CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS __weak __kconfig;
+
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	1
+#define NMI_BITS	(1 + 3*CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)

 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-- 
2.55.0


