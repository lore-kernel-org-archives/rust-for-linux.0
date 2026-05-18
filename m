Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FC717D6
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 02:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779069958; cv=none; b=hw4KURcFhUMOK0ySBam5PRHPQ3EE9sMZuJHNmpyo25A7hGyTvF/pXPqazb3vSjQ3FCGbaXCUOPPWMYeDxjFnzx8u5WJFusxqYhb09ZVGH1LiuO7dRI0PBK0rFZ1DcOuYf2Yl7Y41EBC0SXgFOS+LdpVr2jeafuD5kSLZ1kRxdKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779069958; c=relaxed/simple;
	bh=tjaNo4Pe9Rh2XHyk7D7QrlDsblk+2n5cxsaVII/Bhco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjXbVPB3VxC5pbfnALOVg46tGx5WMHK5iWq39HuLhEY1qTmM6hWc3MsJgvoGzQFAjVlkgINfd3nfYSdqoJUMuxjpjW6FRgP8PIqkleGyGkfXk0GhgVvgFShdAthx7dxCO2fvB/+tEYg58rFWMWZuu74Y+C8k04veeSp+iCfgO4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwtmASR/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwtmASR/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so9881175ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 19:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779069957; x=1779674757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJWkzHTJO8cjKcvE8KLeCy2PaPzu2de+0VpvqybaanA=;
        b=MwtmASR/cyMGqwVKHWhKIE+URrGdbta2yH6surjGjbaZnJtVQdby2ooB0A3roKjnnS
         Ff1PGfe/5xlWbtGPAbiUCikVGyendJ/5YO4Lygg4PDxxRjT9UepcsypkPyn8A2UVKpAl
         d3V+hbjc+O1PK5LdrL/ka6+Pmha1jyO6AObpHxjqz3huxvc4HPw5iUUHeFAmFH9xe3qb
         w2i8xvQ5fpNwtCSfdoMwxabrdJ1LuCuWP9Ro1u0zfwF2doZ9NfMYBqaIo+US6l6jtjWq
         sWuafqT51f/AyqYwUi54Po4jwngpKTK2mIrKhdZJQF1KD4M4eHUrLbY709kWtQpQFoWP
         FuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779069957; x=1779674757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJWkzHTJO8cjKcvE8KLeCy2PaPzu2de+0VpvqybaanA=;
        b=A5YZssf2xdnVf3lhZGBILxnYpxB8BxuP23PoK81TOvBQTLrx9bQxE1tvkJjSt73hdm
         NB/XrB02V1wCmrpkj5KkDbaV7MsR9mc6B6Laj8Mk3pDel9PBcr4rNzWyJgd19vAKYjxB
         lLLHLzgcuJ7qLwMxo0K2daAGTo2FOT9ByZc+PShdHyiF+K+6zpv9osKCRSGnsvEBaz0O
         adFLBdprp17nkJz/c/pcrF4KRqYgUC8dR0YpN4hPVnDAd8S4ruHvZ3dxIyRtL/sGw48u
         BMsYvdJ/O4GxpOS75K1vtVW8R8+l/7tzRcVOjLj8xrsyq/lV7BzIyyoRbTT8I8rI3eUB
         KM1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+t4l6D/tCOudD+Oir1vydXX9xIs1thg1ap7cPuyhr+WtymeuuuvotPLHRpPZHf+96PaTFBghggw2RauZ0pkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrtsNtbw862rlN7W4eGnqJ8BHX4NMEFWmV9FzbjhZIL7uyq64I
	rBiCEChIwG9SSgT0K3VhTikek94j8tqg50FHQTDe6501p34Xb4AEbclc
X-Gm-Gg: Acq92OF6ynWp6dKByc+qFCWYzg62/kBPxUl0zNM0YHSDB/wTsl5T2iJblyHE/6cfmAl
	zIi6XxcGAFb9xXWJj605vNLcHcqaIARHwaGeMBaqk9NVNXXkQaL6dLEcO/l8qNbcvsMrslFZF6v
	yCgIO9rzgrJfp1YxIGu3KaBs6Zhy2Lg79JFjzzVB1VM/itsaiFDwh642AfXjtjEgewccxeGkpFw
	R4EBrYu84kl6ALfBpc2fYTOdOIM/ykKpbjS8IzLnm4HMMZj5x84BU2cFJ1MFCNXOvkf0hOn5rZ8
	MbvPmHLO0/EmbPF0q0duoNAewTdjRRokxzQeeRsmZ8BOolGVHMyJWygxA8liaL22n2LDOmGKgQY
	blW1ulhrJDpdAfNZ4yrhHYFxUM4xKQg/DbHPIl/004gepSMJ1Awg8bbFPprSCdogMnMVOsIHVfg
	oBTiHkqORbw5boBtfPSjs/i1wlTAK7v7KvoGsJB+7qM/Ax1VvhK9K9k1agawCc+ZCzTQ==
X-Received: by 2002:a17:903:11cd:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2bd7e94d2c0mr146007735ad.24.1779069956570;
        Sun, 17 May 2026 19:05:56 -0700 (PDT)
Received: from ?IPV6:2403:581e:fdf9:0:6209:4521:6813:45b7? ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600b4sm131516175ad.28.2026.05.17.19.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 19:05:56 -0700 (PDT)
Message-ID: <5dd6cf03-4c77-4f37-b1cf-819fb5adc5b0@gmail.com>
Date: Mon, 18 May 2026 12:05:49 +1000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Untrusted Data API
To: Gary Guo <gary@garyguo.net>, Greg KH <gregkh@linuxfoundation.org>,
 Benno Lossin <lossin@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
References: <20250814124424.516191-1-lossin@kernel.org>
 <2026051610-flint-compound-810f@gregkh>
 <DIKD7YHDGMQE.203C29N5H5AWJ@garyguo.net>
Content-Language: en-US
From: Alistair <alistair23@gmail.com>
In-Reply-To: <DIKD7YHDGMQE.203C29N5H5AWJ@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/5/26 05:58, Gary Guo wrote:
> (Resend to reply-all, oops!)
> 
> On Sat May 16, 2026 at 2:21 PM BST, Greg KH wrote:> On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
>>> I didn't have too much time to spend on this API, so this is mostly a
>>> resend of v3. There are some changes in the last commit, updating to the
>>> latest version of Alice's iov_iter patche series [1] & rebasing on top
>>> of v6.17-rc1.
>>>
>>> I think we should just merge the first two patches this cycle in order
>>> to get the initial, bare-bones API into the kernel and have people
>>> experiment with it. The validation logic in the third patch still needs
>>> some work and I'd need to find some time to work on that (no idea when I
>>> find it though).
>>>
>>> I also think that field projections are necessary to make `Untrusted`
>>> reasonably useful, but I'm open to adding a stop gap solution in the
>>> meantime. There has been some movement at upstream rust on field
>>> projections. I submitted a project goal for 2025H2 [2] and it most
>>> likely will be accpeted. I also opened a tracking issue [3] for the
>>> language experiment that will drive the design of the feature.
>>
>> Ok, I finally carved out a bit of time for this, and moved the user
>> data pointer rust bindings over to use untrusted, which looks like this:
>>
>> [snip]
>>
>> Now, this obviously blows up the build as everywhere we are attempting
>> to read from userspace data, the buffers are marked "untrusted".
>> Ideally this would be simple to just go and make all readers implement a
>> Validate trait, BUT we have fun things like the debugfs bindings that
>> attempt to do automatic conversions of any type being read from userspace:
>>
>> impl<T: FromStr + Unpin> Reader for Mutex<T> {
>>      fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
>>          let mut buf = [0u8; 128];
>>          if reader.len() > buf.len() {
>>              return Err(EINVAL);
>>          }
>>          let n = reader.len();
>>          reader.read_slice(&mut buf[..n])?;
>>
>>          let s = core::str::from_utf8(&buf[..n]).map_err(|_| EINVAL)?;
>>          let val = s.trim().parse::<T>().map_err(|_| EINVAL)?;
>>          *self.lock() = val;
>>          Ok(())
>>      }
>> }
>>
>> So, converting the data to the "correct" type is a fine idea, but then we
>> really want to make the data in that type as "Untrusted", right?  But how?
>> Force the caller to make the type definition as untrusted?  Something else?
> 
> Forcing the data to be "Untrusted" can be done like this:
> 
> impl<T: FromStr + Unpin> Reader for Mutex<Untrusted<T>> {
>      ...
> }
> 
> Although I suppose for debugfs you would want to validate immediately, so
> something like:
> 
> impl<T: FromStr + Validate<Self> + Unpin> Reader for Mutex<T> {}
> 
> Although this does force `T: Validate<Self>` which does not allow type-changing
> during validation.
> 
>>
>> I thought about a "blind" movement from untrusted->validated in the buffer
>> here, but that feels to circumvent the real idea that the data coming from
>> userspace is "untrusted" and must be checked before acted on.
>>
>> I have run into the wall of my rust knowledge here, am I missing something
>> simple?
>>
>> Also, the one user of this trait so far in the SPDM patchset:
>> 	https://lore.kernel.org/r/20260211032935.2705841-1-alistair.francis@wdc.com
>> is doing just "this is a C structure, so all is good" type of validation:

That's not always the case. For `GetVersionRsp` for example we can do 
some validation that the data returned matches what we expect.

As part of the `GetCapabilitiesRsp` we also have to ensure that the 
length of the data returned (which is dynamic based on the version 
support) is long enough to fit in the type. If it isn't we have to 
expand the underlying vector to avoid soundness issues. As that is still 
a spec compliant response, but would leave unallocated memory at the end 
of the struct.

One issue with doing more validation is that we don't have the full SPDM 
context in the `validate()` function. For example `validate()` doesn't 
know the version or algorithms that were previously negotiated, if it 
did we could compare against that.

I wanted to do more validation in the `validate()` functions, but don't 
have any good ideas of what else to check for.

One other idea, was that considering SPDM data is generally pretty small 
and not a performance bottleneck. The structs could be converted to 
non-packed structs and the data can be verified, copied out and the 
endianess updated. So the actual Rust struct output is just ready to go. 
But the overhead is a bit high

>>
>> impl Validate<&mut Unvalidated<KVec<u8>>> for &mut ChallengeRsp {
>>      type Err = Error;
>>
>>      fn validate(unvalidated: &mut Unvalidated<KVec<u8>>) -> Result<Self, Self::Err> {
>>          let raw = unvalidated.raw_mut();
>>          if raw.len() < mem::size_of::<ChallengeRsp>() {
>>              return Err(EINVAL);
>>          }
>>
>>          let ptr = raw.as_mut_ptr();
>>          // CAST: `ChallengeRsp` only contains integers and has `repr(C)`.
>>          let ptr = ptr.cast::<ChallengeRsp>();
>>          // SAFETY: `ptr` came from a reference and the cast above is valid.
>>          let rsp: &mut ChallengeRsp = unsafe { &mut *ptr };
>>
>>          // rsp.opaque_data_len = rsp.opaque_data_len.to_le();
>>
>>          Ok(rsp)
>>      }
>> }
> 
> Yeah, this use is confusing between two things: invariant of types and whether
> things are trusted.
> 
> Given a raw chunk of memory say `[u8]`, it may not be allowed to cast this chunk
> of memory to different type, say `T`, if `T` has some special assumptions on the
> data. For example, `T` may be `NonZero<u32>`, then it's invalid to convert a
> all-zero memory to it, this is known as validity invariant.
> 
> There's also safety invariant, so e.g. `[u8]` must not be turned to `str` if the
> representation is not valid UTF-8. Or it must not be turned into `CStr` if it
> contains interior NUL.

The SPDM case only converts `[u8]` to `u32`, `u16` or `u8`. So both of 
these should be satisfied.

> 
> We've already have a `FromBytes` and `IntoBytes` trait to capture both. Plain
> old structures can implement these traits and the type system catches you doing
> a cast (or transmutation, in Rust term) incorrectly.

So the SPDM should be updated to use the `FromBytes` trait?

 From a quick look at `FromBytes`, it does seem to be doing more or less 
the same thing as the SPDM implementation though.

> 
> But `Untrusted` is on top of that. It's a marker to indicate that this comes
> from user. Regardless if the marker exists, it must still uphold the type
> invariants. So in some sense, the code snippet is basically unconditionally
> discard the marker, because the only thing it checks is the validity invariants.

I do think we check for both, unless I'm missing something

Alistair

> 
> FWIW, I think our `User` API is not optimal even without considering the
> "Untrusted" markers, because it is completely untyped. Taking a IOCTL for
> example, you know what the type, so it should really be a `User<SpecificStruct>`
> and then you can read out `SpecificStruct` or `Untrusted<SpecificStruct>`. I
> have been thinking about doing that for a while but haven't had time to tackle
> it yet.
> 
> Best,
> Gary

