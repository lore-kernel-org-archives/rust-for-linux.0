Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793327651;
	b=xvwU7sXNZqXaxXzNJPRneVB7Bj4hI3x1B/BJvubteT9KlHif4Hlgf4Og8oFf6FZ5nE7W
	 jMbUr72bftiy+cx8FFAfmdq6RrI33Fv26cudsZC3lV6RvYWUnoio9JbKHAEBStHoAJCGw
	 mSTjN8jDmlUgHuocRSE/4vpxt/kHIcn0dDxbuCCVqfIqIO5PMqT51fyb8vG/e2c1I047R
	 vG1GkQXX6b+qa1SlkCWz1vNK5ExvkYXDy4ehTj8V/oMymuxDtNN6i6RnwNzZLtAjQ4pCC
	 hcifr+16O+Bj239ourWHHOmKU4jadj4Gs2RX3D7DK58NG8HzzK8P3SknR+nmboN0rZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793327651;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yI38pTAxWIJdHS1u48CX7hR1jFdneroKUtAyhW5uxuM=;
	b=phnyKoRPtr8FiURfwIwxXdsM1IdVxG2o+2UWq3qppcFydto7da2XNBacBQBWzJSpSfwh
	 oM4pVBh12IAhX20BUOQXWdQb5g/qVs4RZ30l9GlqAvIhx6YA3wBkLweeH4FIwePD/OUoa
	 XterSVI5TBMncjtm3hUHJeyfNQ/Av4GusVGPRt7TArNaiztZE7RP7pfIG5PQOnMPP4ryS
	 lctQ6SGLywjpd4mqbuQwzwjHO8Mn4gRKWvMM7DlXAC+E1gcN37bPHWqsB3x6I8nsgP3q0
	 Ja4GCNtKo63h+k67G2WYsebW1/7A8ClL2oR8nOugQLsrHfrJJd2d0mWeVZdwzwKBJOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=kJfXCyRe;
	arc=none smtp.remote-ip=203.205.221.231
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90BA606A31A;
	Fri, 30 Oct 2026 02:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C90BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=kJfXCyRe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793327642; bh=yI38pTAxWIJdHS1u48CX7hR1jFdneroKUtAyhW5uxuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kJfXCyReReLjxEgcRDtBGz05NGmtT3sNGUINfEZTiLA4Jcs/I9qWQIPDkDYiFlqvX
	 jN36TG5j72py8+GUziVB/ICQB182RGeXHfDVJcbaDEsBP3sW4NlyKV7r+dqax2+vLk
	 aeK1Lk4qylPjPVMA8Ztw9CIC1O8aOO+aaDLYWoF8=
Received: from shuai-VMware-Virtual-Platform.. ([218.206.237.125])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 8803A8CC; Fri, 30 Oct 2026 10:34:00 +0800
X-QQ-mid: xmsmtpt1793327640t8grxmk6j
Message-ID: <tencent_A0D3062EB058E244877B87B4324B8DFC4406@qq.com>
X-QQ-XMAILINFO: M1ZCvr9KyDXtaCJcnF47S6R5I3mq0IV7kiidH4/XzxN5PLrN7Fu8PsfGr+ka98
	 ubiqSNUdCT4zCufn3DQKkOjLb7yGNZuLMh1y9ltnrfuWvgMF03A9GbDRY0GzF2969BCWySg4Iz+B
	 hN9vAQq79uCukI6ETF0ZxT+HZ/mOm2rS8ojT/s//xwJBcIbhDvfFTtsSPvIhD3VYYYq3lmarP1F8
	 b0ObgRdNiADEeBeHRaRr8vUMli+Kl2xypBPVDBAtD9+uuZzynN6Prz5oN2jWvhTPSJKclDDCNvK0
	 T5kiPNKZCQ4vHW959PlUvPuWrEvLnmR5reDhWuMqaSTMxmAJbbV1/Q0dMOBr8B156RwUxhMiaxes
	 BRHOqi88H+cR9GoDNu6MNV3zl9w7R4A4daYmD9qrhffM2EASkDUlaat70g1FWYA+6HrfxRKNOBT2
	 aRdU3oc/NLZB9mDIrmjJSDOj8sas+cb6AKgH74yPqU1E8u3QHy1SGXEG1lWITj0pykMWikcZ10C3
	 W/SC29o5sSlbNPDQPrBOmsSHSYHOclHvQyBVpjZnhV/UOJC1jvRKd1m7PKOs6fyPzCbmIZQmz5Ea
	 4G9sWsnrpMddsVTJDfB4n9y7tiy5Tq288dYnHKcrvuy4560ReiJPFL+wv669Mj/cY+qQ/CCwIIWO
	 +0BkKh5du0UoXeL/eN7lqkJyFMMZopDKThAgszEtAnPE4skFfM87FsZStIciOD+p4lPKHJCbPUoW
	 0p3yw9rNL9dYmX0uphH0+Lg0Scxf22pLOtfMParg6+PNnx/ECiw9QsV3wGVLjngnA96AcWOFF4jl
	 N2GCd3leWt7iH9qjomUcCHKmohOD7fMIcKg/VK1cA8H0lCG0IhAGTZPSyoYLCZEH0sLNu8PVdaIH
	 SHoiN8hrYWDeaxLz17qN4AiLc/aDKJl2nCSsClrC/F/u5f93mcvrqItEQ/gl9eKhxHpqbqhZSUPS
	 R0ojgaCVtfoupJvRrqwxE5urXV5QnitZZ6dkldPYJboAyjxIkxxgIOL8GqIEbt7MvaUjcQLubGw1
	 KEPxfM64Yjv2a+tJ2Way5QjI17QMaF3DgLH0k1ixj/NuAB2B++L4DiF2cAUAU3P8USfneifbFRiU
	 EeCVmvjnUyCty0//A=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Shuai Liu <847807867@qq.com>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: Oliver Neukum <oneukum@suse.com>,
	rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Fri, 30 Oct 2026 10:34:00 +0800
X-OQ-MSGID: <20261030023400.3849731-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826163101.4168-1-mike@fireburn.co.uk>
References: <20260826163101.4168-1-mike@fireburn.co.uk>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mike,

I read through the v3 diff (patches 1 and 2 in detail). I could not
apply the series locally because the 8-month-old base no longer matches
current usb.rs, so this review is from the diff, not a build. Two
findings, both around alternate settings:

1. set_alternate_setting() invalidates Endpoint<K> without the type
   system noticing

Endpoint<K>'s invariants say the address names an endpoint of the
interface's *active* alternate setting, with the transfer type and
direction of K. That proof is only valid for one altsetting: after

    interface.set_alternate_setting(1)?

every previously obtained &Endpoint<BulkOut> is still usable, but the
same address in the new setting may name an interrupt endpoint or a
different direction. A transfer method will then happily build a pipe
for an endpoint that no longer matches the tag. C drivers get this
right by re-fetching endpoints after usb_set_interface(); the Rust
abstraction currently lets a driver keep stale proofs across the
switch.

Something that binds the proof to the setting would close it, e.g. an
Endpoint borrowed from an Altsetting token (making it unusable after a
switch), or a generation stamp checked at transfer time. At minimum the
doc comment on set_alternate_setting() and on Endpoint should state
that all previously obtained Endpoint values must be discarded across a
call.

2. set_alternate_setting() with transfers in flight is undefined

usb_set_interface() tears down and reallocates the interface's
endpoints, which unlinks and kills any URBs submitted on them. A
persistent BulkInQueue/BulkOutQueue built in patch 2 therefore loses
its URBs out from under the Rust slot state machine: the queue thinks
a slot is in flight while the C core has killed the URB, and nothing
ever wakes the waiter. The documentation of set_alternate_setting()
does not warn about this.

Either the method should require an empty window (e.g. take &mut self,
or refuse when the window has registered URBs), or it should document
that the driver must drain and drop its queues before switching, with
the queue Drop doing the cancellation.

Two smaller notes:

- queue_reset_device(): I checked hub.c; the "may be called from any
  context, deferred to the core workqueue" documentation matches
  usb_queue_reset_device().

- EndpointKind being sealed with BulkIn/BulkOut/InterruptIn is a nice
  fit; control endpoint 0 going through Pipe instead of Endpoint avoids
  pretending it takes part in the altsetting lifecycle.

Best regards,
Shuai Liu

