Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9432E7360;
	Sat,  6 Jun 2026 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780767365; cv=none; b=AQQ/yVNnDqbz7Lw5vWjXiK4+zDrpuqPFabHQj40fQ1gLKMcV8kXkHFh+/B1s4kas4ujtrOhlnpiPWUdMg2ZB0Kxs+VMSu5wyfQC5DFWrKfQox0eRBXlkonse4KHtCfVSuIEdUPq2F/4GcKh8R/os5S204vKNuQ4xAYmCXjC6Fcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780767365; c=relaxed/simple;
	bh=hoTz5ORdtTK5FwPusv9H13APQ10mO4mz6q+Pin7PH+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VoqMCSeU9aGDeXZvubRKYTMo1a4T7CznKeWLK5rQ/jh7IW3TLbceTazRZ6z1hF3Upat8LjCvMRq8No+De6VGMatoPIQQquvaxXpMnpTGZs4onUb0jDNVpR5tOf3K5kGS5AQzHvkQGRFj4KGek3IZcgpZ++9CBsfwngYWorcCOUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgiJexvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgiJexvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003CE1F00893;
	Sat,  6 Jun 2026 17:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780767364;
	bh=jBc2HZnh0SMtW9jiH3KstxOf78fFG0X59AzluyI1NnM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jgiJexvy1HvxLcifY5kmpqej++mDAHVZnhYzP25Xs2DiKldHjgoiHvq/MQA30W+BR
	 rdmOmBrJkMIIQTq/v4YqeO5yapVHHjEzJJx9XzrUNvgp9nbpgiT8UOI0p4NqcSAqkV
	 pg5Am0tUm3aS3tNYNJiGdF72RFya1UdiBN3ltObfsxQZNiYA/dRMocTpLzRbVfmKCa
	 5BUg9nRUE7bU7q5ehL3f0V9A0YJH1v4uQp0BuGc8+rmFLjpInBX3IJfnmdSdXl38r3
	 kFhps6q3cMaCHHEawJSHW7xRZ8gucDgGDcDEwv1xhIW5D56UMgSXhbMuGZavCOTITk
	 qSG6oh/mpsLQA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Akinobu Mita
 <akinobu.mita@gmail.com>
Subject: Re: [PATCH v2] fault-inject: rust: add a Rust API for fault-injection
In-Reply-To: <CANiq72k9Yc=tQgSEUXgcaJaw+Jub0ZX8g8XWsT8dA4kxifxGEA@mail.gmail.com>
References: <20260605-rust-fault-inject-v2-1-aaf978883cc2@kernel.org>
 <CANiq72k9Yc=tQgSEUXgcaJaw+Jub0ZX8g8XWsT8dA4kxifxGEA@mail.gmail.com>
Date: Sat, 06 Jun 2026 19:35:55 +0200
Message-ID: <87bjdninb8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> Hi Andreas,
>
> Some quick comments scanning your patch diagonally since I was here
> for something else.
>
> On Fri, Jun 5, 2026 at 3:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>>  #include <linux/ethtool.h>
>>  #include <linux/fdtable.h>
>> +#include <linux/fault-inject.h>
>>  #include <linux/file.h>
>
> Please keep them sorted :)
>
>> +// SAFETY: FaultConfig can be used from any task.
>
> `FaultConfig`
>
>> +        // SAFETY: By type invariant, self is always valid.
>
> `self`
>
>> +    /// Returns `true` if the operation should fail.
>
> [`true`]

Thanks, I'll correct these for next version.

>
>> +            // INVARIANT: `self.inner` is initialized in ffi_init.
>
> I was going to say `ffi_init`, but there is no such call here. Isn't
> it getting initialized by the C side? I guess this got copy-pasted
> from somewhere else?

Thanks for catching this, it is a stale comment. I was using
`Opaque::ffi_init` in an earlier version (pre v1, this was also present
in v1).


Best regards,
Andreas Hindborg



