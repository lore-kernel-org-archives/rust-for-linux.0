Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263896;
	b=4CCq8yDVkvnygHM8N+7eyCE0yjSBSslyZtaz23YYr5eq2JoT2IAJDZVQkBhnYRwwxNI3
	 EqVytxl/9xZB/1b0esKRS8taGqm0PqNx+hxIqKv+AoM8mLgjDSNj4fmEFfg6+gUq/sBS9
	 5vklu7+C9vIcVgZrE+QLy2oiImRmUTxR7SQrqHmquLi2U4NR1TFo9jzz56R5A4IpX2Fqv
	 qGgpB4qJQfQCs6H+noPTVPYNLvfu1hcugcgMKEkiVV5XbFeeLry5m9dq8V/uaxUuaZIGm
	 owZ/DPwZk0maEPZ7A/mSvj6g09E5Fdx+39SI+Qs5CTlzSy6T0ctPo7xgTpEiMBiyirA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uWoSKvG13Bf1DgxAL14kWttvPonvgvUBLko84wLjNeA=;
	b=li8EW5YepIdYCfubMJSdjc00xnJRZhw2RrrpYnoDCLbpasprP5lYK2sTh5hzny6tj3uQ
	 Yuv9n+KuUK8i2TQh4N/6EiqEn2lM0bBeXKd3vKFfY+C9yL7+TKbhLAw5DaUFw0ZWQ9eT4
	 kBbhww5SjTwlO1NZVusOzPdrKAoBgM1+V/oXi0O3PbloU7PwSfApKtyhRyXoxClLCfWMi
	 Jt1kUQxQC8mR6jK3HY1SQ6wndAmtQFW+sj2Lg9bnB5bwryAhuEn7eXAIwH3wYA6fpEp/0
	 8gZi+9uxpbtqcCpGmh+vmdHSbegIPOIQE9WYAKQypXfMmpFcQlGzBl/a48E0vUiGpsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ec8Yau+9;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F73D606A321
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 22:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F73D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ec8Yau+9
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed3f563739so7745ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 14:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263894; x=1794868694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWoSKvG13Bf1DgxAL14kWttvPonvgvUBLko84wLjNeA=;
        b=ec8Yau+9npUyaUQrZUyLAHJMN3zGsPf+6xUJdJzPUof8E2pG4MChL6Ks0iY7MuprYE
         rsSYCfbOzoxEmGUi2CYs2M3dPVPUqlQ3cELP3YylGi4edfazs4heJtrT1HNUn4gBpljV
         vSCaO9386JIxsvlp/qbZ/MCh4821uOy3uaKibf0o+oR8V1V6WMTFEXZE5kyPYnKxIXrs
         S766m4s54iDjemrWYzi/0c4/RbilMDdDAyk8zEFTLzoLwRyi85f0JOoGn6y/+rKfldQR
         d5TjHDbzZHkwS+AkXU+1WvqhNNVolk+e0LqG5+EnXMWue3bQAI590TqANo8wAQcl3FKf
         i/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263894; x=1794868694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWoSKvG13Bf1DgxAL14kWttvPonvgvUBLko84wLjNeA=;
        b=COG7wW47wORGaPCeqORRGpfTd1PdUyAX/obPUaJ4NDLw1yvxVXEKQRL7F48NQ9+grB
         HGfAP5/Hk3WsJEbuRzBM6QGhOWe3nk6EaIuFBrTOrUVrkgRrCHXkCmnJL7Lo2LQsTOuT
         Zo87mTORzzlZLo8E8qirLdu0q1s4ssIa4cjEZtfKpufv0BJm60rgZ9SLrSjHBtpkebd3
         MnuWNqm0fW0De13U0cmLex1Y2o/v0SUop/VzdNcyd2GCC875ZgtO1/wxgormfHsoCSCm
         950rmRXDYllFA+dLRh9gRTJWfNpEXs121F8Fwj4G+Mn7/bAZRiitXWwhiUiWuxDuPB4E
         QeYQ==
X-Forwarded-Encrypted: i=1; AL+hErEzrr0NPeqEWDuMsLbaw60lFC1YxnhYOxPPsLIo74cwMIqzpmHnsPILJwpgWgJs02JILG6zOlgX8pBk6LPBYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8q4BCewQ8PirZ4OwPqFd+f4LU4IzxZmKr78MS2BmjMkiVBW/nP
	tcZfA5HCLviFqx0O66ca+QbMNXhgDbzPJFqfo73iz0sGC8UC2spX5JqsxJWwpIHNDQ==
X-Gm-Gg: AYBFou0Z50RIHPua+zvG3una9DZdoVQrC5u/nUQKHkhGul+gn93h3ke+bTGM/jzxIlm
	Q4Mw2AwpLf+Y+QLNQSCEdfqrIVgY7JkJBzQ9eM736J1NXOQmbybzviMIaeCfINAowbEOX6Xvhnc
	oXrN43ydrTKCCBhAWUAbc0AE08BgqadX+wEuo8JcLLG5T/y3NfNixZSjXv6KT+e8e+afonFE39D
	98yjay8WNra7D3H0+b7R03a2+6FarAFmAIlbOEPyQwM+kpD80a49CZloIV6EERFfQP+t39UUK/E
	vwzcakvlRJ4sDJfZXB/V3JiIgxTJBGA8H31n3wVQ4UHKZbdTo8nzfQQvxiRbwKku4dziSpimVLx
	AXO/YqL9qqVjKsIfn93A99Vc3C7jIpjkzZ7SZ+sIsDPYRgW1wZQjNR2UfDKWtW8FKQZoWecTaHM
	vpk2nLeZKK2q3sNmw+egCVZADKoFzBJ9ykQdT01Edeq02seYzNWcZvhBXqvVuHlmvcY2vCiXTuB
	9w+pk7JWt9/OWNDdPYhktvix4SG7BTTsfHKv8+XsZGQL6WWHFxIcrQ6Nk7UgI5yWjWZ3qSXUrno
	GfkdwtD/hXaah3ZytnV0n2iBiSOnSYrl4QmbcrkzhFj446z1aBsxShEIyWicci6R5QQRYHqjYXC
	+3gBCNYAXLqK19aORN1lVex09jGu8g8CcoS+j9K/Hv9ClYuChwemAx2P3c0RfpqcpZU6WENm240
	r6AaD1qeVO51u5+BJfGV4xMFy5MeOtvpbRw5nyldxq+X2vwP/BjXEJ/40eoiZwhv6U
X-Received: by 2002:a17:903:22ce:b0:2e6:344:7bb4 with SMTP id d9443c01a7336-2edba3c0276mr716915ad.11.1794263894152;
        Mon, 09 Nov 2026 14:38:14 -0800 (PST)
Received: from google.com (25.229.125.34.bc.googleusercontent.com. [34.125.229.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16797069bsm1108885a91.14.2026.11.09.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:38:13 -0800 (PST)
Date: Mon, 9 Nov 2026 22:38:09 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust_binder: push BR_TRANSACTION_COMPLETE before
 BR_FAILED_REPLY
Message-ID: <avJLUdbdxhhUDL7K@google.com>
References: <20261028-binder-reply-fail-v1-1-8b71d4daaf1d@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-binder-reply-fail-v1-1-8b71d4daaf1d@google.com>

On Wed, Oct 28, 2026 at 09:46:45AM +0000, Alice Ryhl wrote:
> When building a reply fails in Thread::reply_inner(), BR_FAILED_REPLY is
> delivered to the caller before BR_TRANSACTION_COMPLETE is pushed to the
> replying thread's work list.
> 
> In a nested transaction, the caller can wake up upon receiving
> BR_FAILED_REPLY and send an outer reply to the replying thread before
> BR_TRANSACTION_COMPLETE is queued. This causes the outer BR_REPLY to
> arrive ahead of BR_TRANSACTION_COMPLETE, which is not legal. This leads
> to userspace tripping on an assertion.
> 
> Thus, push BR_TRANSACTION_COMPLETE in Thread::reply_inner() before
> delivering BR_FAILED_REPLY to the caller.
> 
> As a nice side effect, this lets us remove the now-unused
> BR_TRANSACTION_COMPLETE error path in Thread::transaction().
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Sorry for the late reply, LGTM!

Acked-by: Carlos Llamas <cmllamas@google.com>
