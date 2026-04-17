Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB63F3C5DD4
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438720; cv=none; b=m6SOnUB1fpWzaeaIT8RXnNaSGhy43HdwTwKtD98DFKZ+d9SwG1PSaweh6xwDKP63F2S5lqJgLcWu3PA55yvsPeb8c+mLQVU3yehrFKOdT9m6uyztxnlD34hMyriF2liE05478fH1gf2NW6Oo4DiHwHFyl+iA7ecSpb5MKcLPI1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438720; c=relaxed/simple;
	bh=hE91+ODNE/cyUlwhydK+2PgiKWGGfc/idUIRysntKY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcI9R6WOa9mObDpUVN63cPEYLpO1AcCYd/+oin4rwU+TvRJJ1PfipXekpUQoQDS1jvM/uPV+V0k20cwAa8XWIZGDFzgPNoSau033K2CSf1JrdBZTPvUkQ8NCEHgTWZiXXi/X03OGyg00kmWhO/OyTK0IbN18GWAiil1tQEU1CGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Aq3s/d1Q; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Aq3s/d1Q"
Message-ID: <03096a35-a5de-4fe1-b235-42c1647b8563@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776438716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hE91+ODNE/cyUlwhydK+2PgiKWGGfc/idUIRysntKY8=;
	b=Aq3s/d1Q35SNh01ElXCno+uaYR8qW6Od0mIGP+Xo6qSBdFYBSI1hAgiWAIfay+xZMx5PAx
	CIVy9tD1CGrhfK5MwGOhUTn6rYwcrY8SdanxcdkyCfcJ3vghL/Yif8DSlNr6ObYvLVvpNA
	usH7aSP8muoo+JlFfTyuMxw1DElM3sc=
Date: Fri, 17 Apr 2026 23:11:35 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] rust: xarray: Add Guard::find() helper
To: Tamir Duberstein <tamird@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
 <aeGKTIRFgBqHNI9S@casper.infradead.org>
 <df183bfe-21b9-4393-902d-18835e0bcf48@linux.dev>
 <CAJ-ks9=veRG_8SZ7CyzqdR2RhtJ6QZWozyo8oc-xnwoqpCdg6g@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <CAJ-ks9=veRG_8SZ7CyzqdR2RhtJ6QZWozyo8oc-xnwoqpCdg6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/17/26 22:52, Tamir Duberstein wrote:
> More complete wrappers around the C APIs exist in Andreas'
> https://lore.kernel.org/all/20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org/.
> Perhaps we can borrow from that series?

This looks like a very complete xarray implementation that includes the
APIs I want. I'll look into how to integrate this with my patches.

Best regards,
Alvin
