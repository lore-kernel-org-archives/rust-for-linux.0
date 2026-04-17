Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841CA19E819
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 02:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776392255; cv=none; b=j/VnVSJlnu4Lpc6smo5Yu7QfQ7vERyf22fMflFC1jiC90eFLZQcbTMQJNytwsmHRQnuOND6mqXP6e82/Gpsz/BXCDEOb3U/C1atwuVUxrAXMB/xK391u1pP56C5FhyzPicik0XInyMB/szkIjnYOKvfleJWu3BIOwS4b69hH+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776392255; c=relaxed/simple;
	bh=rivnrE2zdXiTe6uA9F655U7A63sKNhxL2j1BO99/KNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAKMO9mBJ1XuO+S5HBF1Td9LQ2nccnVyspcN7B/xSVRy4aDyONehHbhe4zx+pxB235A3gjgHsLbaKkQOkv1raPEyf/noyUZoiR9hcOa/mT3+dlzFZYpBzVOfsRj+Cb2ACQ2rlIOMfr7nUtWL6mjuf2VdiFgJKq7QhybeMhLNsDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ePuf2bAf; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ePuf2bAf"
Message-ID: <df183bfe-21b9-4393-902d-18835e0bcf48@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776392242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpE0Ez+CfIoCGnUqity0iKPTIYaJICOJp37vNEf2Pwk=;
	b=ePuf2bAfPWmOfImJwnTQrq5T9bUWrri+n7NIsp9KYnA7oO4nDzM/fUB3u3FeYxVV4Yj8rb
	rfunkJ4LPwc2adnexxRrsZfpZc7edlQSEbIYcXfKfuVNYxFuMjtjok63FVo/rbLN3G+OLv
	RsoxMO0TywgV/aDVUFRtorhw0NJoElM=
Date: Fri, 17 Apr 2026 10:16:57 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] rust: xarray: Add Guard::find() helper
To: Matthew Wilcox <willy@infradead.org>
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
 <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
 <aeGKTIRFgBqHNI9S@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <aeGKTIRFgBqHNI9S@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/17/26 09:18, Matthew Wilcox wrote:
> On Fri, Apr 17, 2026 at 09:05:54AM +0800, Alvin Sun wrote:
>> Add a helper to find the first present entry in the XArray.
> Why would you expose a function which does striclty less than the
> underlying C implementation, rather than exposing all the functionality
> that xa_find does?
>
>> Returns the index of the first present entry, or None if the array
>> is empty.
> Why not return the value found, like xa_find() does?

Hi Matthew,

Thanks for the feedback! I had considered both returning a tuple (key, 
&value)
and an Entry struct, but only returned the key since that's all Tyr 
currently
needs. I'll look at other Rust code to see which approach fits better, then
implement it properly in v2.

Best regards,
Alvin

>
> This is all very troubling.  I don't think Rust should depart from
> what C has without good reason.
>
