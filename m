Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF81EA84;
	Sat, 14 Feb 2026 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771054976; cv=pass; b=Lli2boN1XecwI3htEoIa/61XwssC0AJ5n4i5KIFdNVr2bpLUGx0TI+vZpUTA/q8tk5woZEh8sOfvXQV8DndVqlkxqkEJRHlDMVbiXyzpok1wpT9jkWr72IByT0/vHllEcSLvalXD3JVKaXYDXf3lsXrfRR+EAinPJG5EfdN3k2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771054976; c=relaxed/simple;
	bh=IFx91vlqcpIT5vlxhfc+D2UENPZYCUNJxGooXjx9lXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnzyBt5zEbHeTVnvhjnrpFnF3rXtFEwJsae2zoZQ3d00FM6fbxxDpzrbG9JV61lVlu8NF5rDaNGVp7wz71Ewe1LBpFbRkD/Cu28enRPpUTxxs7iKq4IrcWPREy+TsWyonJbpcbQSa6e5CEGx8qn9x5Qf0N4mnjDydnJ4TlXXp8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b=VUNzaxET; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b="VUNzaxET"
ARC-Seal: i=1; a=rsa-sha256; t=1771054926; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=OuA6D1mgxTkSPEnM2ojVzZj0BkITUlSUADMI098nGvQNLatc8Xu+RDHcKiSpgwPEnTacPdIv3YDDdiNK8AAM5W5Ov5i+lNg0XeBsG3uhUO/KUCSAa5l0iqGIH1pN7Ej7io+n0UW47yam0Rd0bHfHwPodQoW3B9f1S1Ur/Doxo7g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1771054926; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lhfYTN9oqOqvsdOUvoEUruipzvDo7M+uz4tjyp3RJUA=; 
	b=IC1LvDmMoqxom+8qUppwkWcoLFAzwgAEsII2AbVe49Ww23f1k0fezd0v2khoARPiOxhJhOdvxEqQhC/n9SqqodjUtJaj6Pc36SmOmM1XAYXS/DHqIqacLko0U3dX8OIhc5d7fBLPV234rxOWXrttAq8/CYmmxdHQRw8pIE3yVp8=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=shivamkalra98@zohomail.in;
	dmarc=pass header.from=<shivamkalra98@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771054926;
	s=zoho; d=zohomail.in; i=shivamkalra98@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lhfYTN9oqOqvsdOUvoEUruipzvDo7M+uz4tjyp3RJUA=;
	b=VUNzaxETr7iGsPan4E7gSYJ326qzmVdM3xUC8zNsbJilGI2q4dR4ITxepuhOeeDi
	j/E2Hu/m38wUlq9/v0rHJL8JRDuTq4fa89sMsTBTbZFwKQuVXJFO3dialMd26OaNkfM
	C24w24JfIbDDr8nbW5Ak7tQu6XGXKy/+5rBdkgsU=
Received: by mx.zoho.in with SMTPS id 1771054922808110.99880725998548;
	Sat, 14 Feb 2026 13:12:02 +0530 (IST)
Message-ID: <75202b71-e5b3-4833-9fa4-e0b279900b49@zohomail.in>
Date: Sat, 14 Feb 2026 13:12:00 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rust_binder: shrink all_procs when deregistering
 processes
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260212-binder-shrink-vec-v3-v4-0-bd02f06bf2cd@zohomail.in>
 <20260212-binder-shrink-vec-v3-v4-3-bd02f06bf2cd@zohomail.in>
 <aY9PG909tCTZgMup@google.com>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@zohomail.in>
In-Reply-To: <aY9PG909tCTZgMup@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 13/02/26 21:49, Alice Ryhl wrote:
> On Thu, Feb 12, 2026 at 01:47:09PM +0530, Shivam Kalra wrote:
>> When a process is deregistered from the binder context, the all_procs
>> vector may have significant unused capacity. Add logic to shrink the
>> vector using a conservative strategy that prevents shrink-then-regrow
>> oscillation.
>> The shrinking strategy triggers when length drops below 1/4 of capacity,
>> and shrinks to 1/2 of capacity rather than to the exact length. This
>> provides hysteresis to avoid repeated reallocations when the process
>> count fluctuates.
>> The shrink operation uses GFP_KERNEL and is allowed to fail gracefully
>> since it is purely an optimization. The vector remains valid and
>> functional even if shrinking fails.
>>
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
>> ---
>>  drivers/android/binder/context.rs | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
>> index 9cf437c025a20..399dab475728b 100644
>> --- a/drivers/android/binder/context.rs
>> +++ b/drivers/android/binder/context.rs
>> @@ -94,6 +94,17 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
>>          }
>>          let mut manager = self.manager.lock();
>>          manager.all_procs.retain(|p| !Arc::ptr_eq(p, proc));
>> +
>> +        // Shrink the vector if it has significant unused capacity to avoid memory waste,
>> +        // but use a conservative strategy to prevent shrink-then-regrow oscillation.
>> +        // Only shrink when length drops below 1/4 of capacity, and shrink to 1/2 capacity.
>> +        let len = manager.all_procs.len();
>> +        let cap = manager.all_procs.capacity();
>> +        if len < cap / 4 {
>> +            // Shrink to half capacity. Ignore allocation failures since this is just an
>> +            // optimization; the vector remains valid even if shrinking fails.
>> +            let _ = manager.all_procs.shrink_to(cap / 2, GFP_KERNEL);
> 
> Not a big deal, but perhaps we should write len*2 here instead of cap/2?
> That way, if the cap got way far away from the length, it would equalize
> right away.
> 
> Alice
Thanks for the feedback. Will add this in v5.
