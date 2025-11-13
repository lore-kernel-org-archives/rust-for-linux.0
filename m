Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758D92BE632;
	Thu, 13 Nov 2025 21:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763070918; cv=none; b=LV+ooycp0c2F1ya9IINmIYahsN0jtuo1sFuVrkUPPtfpIfjU8ukKMjiwJ4f/3acbjdifpleY1iJmPpdUvvK0g2Ozc52+m+y3d9z2lLlxPEyUx5lQo52lf2NcDhyYbz+/ErvaS8svNsxhMtL7lE7FWNTNpk2oujegz8drAaYzruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763070918; c=relaxed/simple;
	bh=dDYWv5SYqWgnUYfpzg0MJ7Kc0K1gt2Qkv/Z7vA/nq7o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=fDr9gffi1AsjqLSIkzGVud/UOWbCQdV//yKiN9X4RqNK5UZP0XYzr8TT0p6tcq2gvmsNuL33wiT+33Yao878Oqx9+PTH7KFLFsE/eA/yyliXcDrpeihGM+g9xtwUG7yqXKA/R3YzSUnfqig57EcXcHv5w2Er+332It0TPylbLTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7ru2yH1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7ru2yH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756A2C4AF09;
	Thu, 13 Nov 2025 21:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763070917;
	bh=dDYWv5SYqWgnUYfpzg0MJ7Kc0K1gt2Qkv/Z7vA/nq7o=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=O7ru2yH1mTgTWU1ARcRcSXk6/Li+sXuhdbxoK46IOeJEDsTzPwWl/qk/Jcnti4Q2S
	 GtheCXIeWs37xh8ayIDpO8QzoWcfypXFxOBytPKBUQtSUAKD5YNtN4WxAG+TXkYAxG
	 PkC38VkVNhm6o2jQae8YAcm85MCl3g6DXDqxlHB14f4j89mGCJ/Zczw0o+GK729IV4
	 FKd5QHqNzq46JMSbZaYt00BkEEt/LRZ9Oat+z4MJ7oR+2tIX4h6Oy1O0gnbOt/I4JC
	 0CbGUN2KAzQHSoGVg/iy4mJLbcr2gEAdYHOxnKgkub7p3YrrMyrIgHKc1I6Z66UwNK
	 UO9FjjVnLUZ6w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 08:55:07 +1100
Message-Id: <DE7WH5KQP268.1GXMZM78VIESE@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/2] rust: workqueue: add creation of workqueues
Cc: "Tejun Heo" <tj@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Philipp Stanner" <phasta@kernel.org>, "Tamir Duberstein"
 <tamird@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20251113-create-workqueue-v2-0-8b45277119bc@google.com>
 <20251113-create-workqueue-v2-2-8b45277119bc@google.com>
In-Reply-To: <20251113-create-workqueue-v2-2-8b45277119bc@google.com>

On Thu Nov 13, 2025 at 9:01 PM AEDT, Alice Ryhl wrote:
> Creating workqueues is needed by various GPU drivers.

Indeed, and of course lots of other drivers need this as well. :)

> Not only does it give you better control over execution, it also allows
> devices to ensure that all tasks have exited before the device is unbound=
 (or
> similar) by running the workqueue destructor.

Exactly, but for this case we should fence the workqueue with devres, such =
that
we can guarantee a scope for a &Device<Bound> for all work items scheduled =
on
such a workqueue, i.e. provide a &Device<Bound> in run().

Otherwise drivers have to either access device resources with try_access() =
or
get themselves a &Device<Bound> with the unsafe Device::as_bound() method f=
rom
within the run() callback.
