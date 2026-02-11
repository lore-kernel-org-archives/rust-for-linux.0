Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49953EBF1D;
	Wed, 11 Feb 2026 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770795783; cv=none; b=rbopUZkVsiFiLaAuOdqz6HAAlh3n7cUFGkMqlMGPSrMCgVKfsQaDr9jm7sljbEnRmQQr0DjYXpExOKmi4esjEfCcUZHY+So5GDomL11MR41LnPkN+VbI/pUd5xAtkghU80zSePsqFvWfTicl8zj6hM1+I0erdQwEXO5D9PKiyl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770795783; c=relaxed/simple;
	bh=ica1Ebj/m1NL4pYs6l4iDuSVu6qcBN3gjo8gIeyJWkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r/gFkU89At5EWBjRiv2eRqBTnBEcdofAUCviDphsrTBTLuUe7PLt5/NAkXWL7k2g0gL4EADI1XpQ6e+ZQZ66wfv1gc8eFPpKBkATUcBGOMlkSOQwP3aflrvljCINuT2hwxpuMif2Y0FSxc045ukTrsizqWSFV72ZKXFHbsOKhsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVhm/HRD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVhm/HRD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2682DC4CEF7;
	Wed, 11 Feb 2026 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770795783;
	bh=ica1Ebj/m1NL4pYs6l4iDuSVu6qcBN3gjo8gIeyJWkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rVhm/HRDb0EmeUqovVDPd7UlILZrIz5H7xyocmof1XPFUQjsyHTeZAhql8GLZrEcw
	 2+kZMr6lvN/VuC+dDLcfOyXpoRahv5qMzU9Fityj9/dmJvls8NcwT4j+PlA1sKA5t4
	 GkeHF5kSqkvjF+S3pe85Zub0ITcs1ioJxjezXv1m/HOxJSMnCyy6ng5M3WfjWpQtTx
	 QuHAhbA1dQngY93qiR8h6C8i+1axp+Wqh3mpG8wCtDXFWTrWi3D3M0YSV9rvVDrF8r
	 MfzSB/ya/xDQTzU+wupQZFTzzKjLQKkLUGVBu0XGM/HWaWjl5LwsOLmXzhiDUYRpIY
	 ueB8yoQlz/TMg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
 <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, David
 Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Harry Yoo <harry.yoo@oracle.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 04/12] rust: xarray: add `XArrayState`
In-Reply-To: <aYtcdGk8zcwaHfsd@macos>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org>
 <aYtcdGk8zcwaHfsd@macos>
Date: Wed, 11 Feb 2026 08:42:50 +0100
Message-ID: <87cy2bvi85.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Gomez <da.gomez@kernel.org> writes:

> On 2026-02-09 15:38, Andreas Hindborg wrote:
>> Add `XArrayState` as internal state for XArray iteration and entry
>> operations. This struct wraps the C `xa_state` structure and holds a
>> reference to a `Guard` to ensure exclusive access to the XArray for the
>> lifetime of the state object.
>> 
>> The `XAS_RESTART` constant is also exposed through the bindings helper
>> to properly initialize the `xa_node` field.
>> 
>> The struct and its constructor are marked with `#[expect(dead_code)]` as
>> there are no users yet. We will remove this annotation in a later patch.
>
> It makes sense to me to merge patch 4 and 5 to avoid this.

It's always a balance. When I merge things I tend to get comments that I
should split things out to make them easier to digest and review.


Best regards,
Andreas Hindborg


