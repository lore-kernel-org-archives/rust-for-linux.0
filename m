Received: from outbound.st.icloud.com (p-east2-cluster5-host4-snip4-2.eps.apple.com [57.103.79.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24519408014
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502089; cv=none; b=icNl3DIPgcSrmyfR7+DGC1vRmUbK3nmbg4vMencfZq/0qcznzH3isprjrY8/5J1dVG2kRnNlIml5r4H9IvCtg4wVXSqruthRKEofUnK6BS3lmEJxwJ7HSXK/Lv5JqxATZTjVVHVABdqWDBoppvng712bv+58wa47nWWQHB8Rx1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502089; c=relaxed/simple;
	bh=jHQBDidGD/gDyP2uRLukKzou2QNi+hUDBR04lTls07A=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qxGXqDosfzrHFWKzeIE7yRhdXQsrVHk1TEvYyjcaQiVCd5L7ksQ4r9jttPrGahTVmkPnZgsk7NRgeb4CkBjhBkE9U390tupKkoAyU23QBpKAu2vS9Zi7DyvAsqO5wf6+t9M7ZFJ+UDbZV5/Rxgv0CDuyT4OL9gd0G7eXXBRwAXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=UBQVKLT3; arc=none smtp.client-ip=57.103.79.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="UBQVKLT3"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-6 (Postfix) with ESMTPS id 4E55818005E5;
	Wed, 08 Jul 2026 09:14:43 +0000 (UTC)
X-ICL-RepId: 019f4102-145a-7386-9a41-faf4d851ae4d
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhNAEMFXwBeC0oCQwZfBlBcHA4ZWAZdMFgUWgxEAlwXFxZWGRcNVk1YFFoMRAJcFxcWVhkXGVFNCEoTBVIHXU1WDUcPWB5cFBcLR0NeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVSAV4KQRlXHx0DUh8SHVAcDlEFWwBGCU8DVRlaCkENSApDBVsARglLA18PWQpHAUsKVQVfBl5fDVkEQwpyEVURUh5eBVVeVx1HUxcfSwBcRVAYRB9dHWYcXABWAlw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1783502087; x=1786094087; bh=Rlt8vlfBNyKk4cSoSC5XZbIR42pZqzh63rscOEUuEwk=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=UBQVKLT3oacYhQ8n0aegz3svu4lYukSUDW88yP6knLV1KGaT4k1Wji7285EPjCnxryG4hr/RJHrgo+HDn7r4BDPD37gBiFefA5LCNBojvqOJxy2LxjxiceQGwaKJrWw8cmq5NxBY0WLWHMQikkHg8wlm+cyH4nHbwQcsAxVBbdIAGHf6oJzBPcHp1FO1HPcPOkbxYzgJyjdWmqqPMwhWzY9WKt74XXq4VRB2q7bYjKWV17eY0FLhXxv8lPGrbBnOZp/IPKTHUhRSqE1aiw033W+fWBjde57ACKAUHZpOnvTtPCL6sAsCkdr1AcZph0brb887tHRHxsasKxUE/l/w7A==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-6 (Postfix) with ESMTPSA id 123F11800B81;
	Wed, 08 Jul 2026 09:14:36 +0000 (UTC)
Date: Wed, 08 Jul 2026 18:14:09 +0900 (JST)
Message-Id: <20260708.181409.2026030282878398244.fujita@aliasing.net>
To: harish.cs.ss24@gmail.com
Cc: apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org,
 ojeda@kernel.org, linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] checkpatch: warn on Rust unwrap and expect calls
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
References: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -S6o572Dt0dytXkNP_h-f-Iu-0Ztuohb
X-Proofpoint-GUID: -S6o572Dt0dytXkNP_h-f-Iu-0Ztuohb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfX4GEfd8sY1SW7
 6ltp6Eu/HpDAST/RUC01/Idt5zws/+YJo4OsX8WZfCjqYa9rrdxqyAxuYelvs/NWzFqQVQVIsvj
 RbHmBUddlvKVmiLXunSI18l/Dqtg7WSdYiOuKH8EXu0eLkIpIBnlitK9QsUwjJZK9lk+10WR90V
 60g5PhpqN9Wh7QdQisCjg4fiL482Uxxu8bL3u29GGjWjgEND9IlTXMrvYxp/t7+6R3kA3mxcRqm
 C1ft/w22Qd16TFPUWlEX/7nkCG8cXiSw87P1zGkPJlfdjJzOAM0GlW7zI/qclAKo58m20YvRMoG
 1QaHh/XQMvf+299THYh

On Tue,  7 Jul 2026 13:51:04 +0530
Harish-CS <harish.cs.ss24@gmail.com> wrote:

> Rust panic paths are discouraged in kernel code because panics currently
> lead to BUG-like behavior. Add a checkpatch warning for newly added Rust
> uses of unwrap(), unwrap_err(), expect() and expect_err() so contributors
> notice them during patch review.

How about panic!()?
