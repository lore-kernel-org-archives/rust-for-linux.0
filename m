Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9A8267B89;
	Mon, 16 Feb 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771234982; cv=pass; b=PyXk2KpHOVw9JJD6xQzULJyOReb4LV9amFWTYFRaWWblnoT1xk66puMtc27LOu0udhcamfqq06mJe6vRaODmUuI6oiNlFrxgr0qTNW8GkqcJ6rqo+GEM++NdG3V6xIoroo/9YHHv/B2alMUDAn0g1XOHEe6CELvnX1xy3fK4KNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771234982; c=relaxed/simple;
	bh=B+wfT2BBfh8NHnvxlmxiAavdS0Blbk427uHO/L6o32o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDQdVYtNcVsEsAsHsoZjdFZELX3oNEEYa4lxNYoiYLmXNYLhrErXC6vZ9vd1BkqfTyDOxPHugKBRIxeab7YhOE2IuEoh8OzHm2BWmvII3v8Gl+yi0uLRGzPo2CfU3dUoVFPNhzhTRZegErnUvd819ru2W7kTcnEVW6Ij1HlO3cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b=cxr4MXHO; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b="cxr4MXHO"
ARC-Seal: i=1; a=rsa-sha256; t=1771234921; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=Y3ogmLHfedo+/iHXtXJrPU+ifm7kP2u807eGr5QE9kb8Zy1McTEUnSHwNcZCSx5CtqMe0Pr0YxhZGdTEsqbuMiutE+UKs2FDrH2s5W9lDafz+4DSEmy4kjFvnXxGHpPwZTWpXXRYzOYDy2P3xMK1zBPfbLDmb1PHEGpj6M/5b4U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1771234921; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nMJ0J7TWB6v/PGG8cPtxuCYxJjGogyMNOruXQ/PyI38=; 
	b=UOqzUu4YU2MDZHLMd9Cl9dwG9C1DXC/UQqaRi4wANadKvm1O7SKswDY571cPTMBHCU+LJSMyeJN/ycafhPkbOq00cG0QBUYv8I+Pfj6lR+PYj5fHWVWOjjw2JIXPhL6c4Gf9FBepdSPtDciZVJY2bmrj2Hs2NPnaMCLEMomc9OY=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=shivamkalra98@zohomail.in;
	dmarc=pass header.from=<shivamkalra98@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771234921;
	s=zoho; d=zohomail.in; i=shivamkalra98@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nMJ0J7TWB6v/PGG8cPtxuCYxJjGogyMNOruXQ/PyI38=;
	b=cxr4MXHOo7ODK9b62cSA+hOxudHBw2EonwoLC+I5ynLgbeEaZmpMP5KVaCHhUL+t
	pgRyjHm67W8SvThGjs8cxSEPkr6BQhMeleXsv8Uo//Ql2UBSkE/7La2AeghUKuMrh7q
	e5DKhGjt8M5XKi7pSI9/3QCKBjI1CaqTMT2RFenc=
Received: by mx.zoho.in with SMTPS id 1771234917892242.5090239623105;
	Mon, 16 Feb 2026 15:11:57 +0530 (IST)
Message-ID: <d9cbb8fb-8e07-4b89-8fa8-cce98c388989@zohomail.in>
Date: Mon, 16 Feb 2026 15:11:56 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] rust: alloc: add KVVec shrinking method
To: Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>
 <DGFVQ8Y1LLY1.SKXJK85IK4JH@kernel.org>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@zohomail.in>
In-Reply-To: <DGFVQ8Y1LLY1.SKXJK85IK4JH@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 16/02/26 03:43, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 9:35 PM CET, Shivam Kalra via B4 Relay wrote:
>> Shivam Kalra (3):
>>       rust: kvec: implement shrink_to for KVVec
>>       rust: alloc: add KUnit tests for KVVec shrink_to
> 
> Greg, Alice, I assume you want to take this through the Android tree?
> 
> With the comments in patch 2 addressed,
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> 
>>       rust_binder: shrink all_procs when deregistering processes
Thanks! Will fix both in v6.
