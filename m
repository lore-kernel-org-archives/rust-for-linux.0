Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963B3C1977
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438386; cv=none; b=J7QH+bktWL2Lbt2+QqrjXl4QrPE053yn/rj36rzvchSeptEFb+VCSqNe5jmKu+mWRd32Y5N9OV4lef3qMqLOUYACGwBX9iHvY18SIn0mXfVJI8m/QWp/8s3XbmpFGqQ6B2poWrHncm85beDFGO+IRuzXjxFD2FJHgatFBxA7s8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438386; c=relaxed/simple;
	bh=zS07p4gDFB6pdBPpu2rNXcWukXsE2BkNWlsBXyw8e9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6NnKE5kO8FcKhDPFuZ0MQg6vEY6TpsrKmP/Du9Qei95RnDKuGQqaykMcREUkIKvVJfeAPhEvgYK52ZZwtpnHk8A7iDLStE7HCubhB7X42vnF6fr25phgbk9zTEH5DNZREecF/D5V5RcxJcUI2EN3yQ7VSrRHps6qhZ7kf4mXnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P8SRZx91; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P8SRZx91"
Message-ID: <dafcb772-cd0c-4771-b418-bf2a09a468a7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776438380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zS07p4gDFB6pdBPpu2rNXcWukXsE2BkNWlsBXyw8e9g=;
	b=P8SRZx91MY45Hnht8g6QGi0CxfNAU6bZHFtcHzFHxQbtXEO/xi3L4iArRBE3qWdaJeBeyZ
	cpkQiATZJbwNUPKoLvXxUCI+/yX6HsxWA57b1yALzMrh4A+ZP+dKTqhjPSr2kGuPz12JHU
	oTxbC4BTNOeIgR6/yNIrW8mm3S+OYqo=
Date: Fri, 17 Apr 2026 23:06:03 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] rust: sizes: add SZ_4G constant
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-1-41c6e9bb061c@linux.dev>
 <DHV3SQ191564.3FMK513OJUMKV@nvidia.com>
 <cb3dd598-04f8-486c-ba6b-9965d93170a0@linux.dev>
 <DHVHKSI90H02.143VLYN9JY4FZ@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <DHVHKSI90H02.143VLYN9JY4FZ@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/17/26 22:06, Alexandre Courbot wrote:
> On Fri Apr 17, 2026 at 8:56 PM JST, Alvin Sun wrote:
>>> Finally, maybe I missed something but the new value doesn't appear to be
>>> used by this series?
>> This patchset is a prerequisite for the Tyr ioctls patchset [2] that I'm
>> currently developing, which hasn't been submitted to the list yet.
> Why not have this patch in the series that actually makes use of it?
> It's a bit confusing to see code merged without any clear user in the
> same context.

The other patches are currently under review and will likely be posted
together in the next version. I will handle future patches properly.

>
