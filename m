Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AB4328610;
	Mon,  5 Jan 2026 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603209; cv=none; b=VT+VRozA+zCTwtyC4IX5BNQCD8kAQg5+V3ufMEoWtVwxx+kYsT9sjXIE/Ugy0ijZyfaq3o8xJLsOAMZN8awFQfrfYtfmnJG0UhaJGy6nxmXTOdwp1ePx9BqMDzPHlH6uhQbRQXoRm3xuyRgRYIDcpl2Qqu4LiGpKsIkr34h8Y6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603209; c=relaxed/simple;
	bh=HXUPTyJ8zcaWYVFct6rzjjmgk6ga8ErsTEkiEOtYGeA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=a579ltNoqp32rHjl+JBCgWK6vqp0qlOPp7j2pjUdxhUAANxZiSafbCq07ydzSBZlPkpg+8cqP18rdhdhjNG7uu8seSIYz92Jz0MqeQLE8hkSGSlnOOvSRu7xiKciJFnNsGeiRO9bavOfLHPS08gQ7/ppHNAGIHZplFfBGmweZ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfac1kjq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfac1kjq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD57BC116D0;
	Mon,  5 Jan 2026 08:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767603208;
	bh=HXUPTyJ8zcaWYVFct6rzjjmgk6ga8ErsTEkiEOtYGeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfac1kjqdfUW0XZd0tfn7XoWhCsDmFRSVmP/Gb1xsP75SHJoKql5TEH7tsnp7Y4RZ
	 MGNq+J5sNrn/K4akZ5RufGcrOsBoNP4PwNhrKmCbQ9roaa1rCKfgh1z4daXmM/JCb3
	 1AP078b4rT/N//19OKEC/Tda38JfsseUF8v6+b7r4d55YidTyHPhZj96TA0GBBaCAk
	 k4nq3WPh9gIDmhpQRIvJwFuie3rZ4TTDzgBaK7aecB36H5wrPnBmzCLqnbWep5U0T9
	 2kREWsj+lPrvGUGlI14CRGjTW03ILVa2TeV4jr3wIXRu1CUt4TPVULdrhD6uyv2hyP
	 38ohFdGbCJlKg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 09:53:23 +0100
Message-Id: <DFGJ1HIK35BN.3RLLMFT1PLP0C@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/11] rust: pin-init: internal: remove proc-macro[2]
 and quote workarounds
X-Mailer: aerc 0.21.0
References: <20251211185805.2835633-1-gary@kernel.org>
 <20251211185805.2835633-2-gary@kernel.org>
 <CAJ-ks9=Q53FX=5TdLoYnM3pgtDo23nHjFy7e7B=-02-U0vZ+Qw@mail.gmail.com>
In-Reply-To: <CAJ-ks9=Q53FX=5TdLoYnM3pgtDo23nHjFy7e7B=-02-U0vZ+Qw@mail.gmail.com>

On Sun Jan 4, 2026 at 2:35 PM CET, Tamir Duberstein wrote:
> On Thu, Dec 11, 2025 at 2:28=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>>
>> From: Benno Lossin <lossin@kernel.org>
>>
>> The kernel only had the `proc-macro` library available, whereas the
>> user-space version also used `proc-macro2` and `quote`. Now both are
>> available to the kernel, making it possible to remove the workarounds.
>>
>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>> Co-developed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> This adds a dependency edge from pin-init-internal to syn, but syn is
> not actually used in pin-init or pin-init-internal.
>
> There's a comment in rust/pin-init/src/macros.rs that suggests syn
> might be used in the future, but as of this comment this is a dead
> dependency edge.

I have a patchset prepared in [1] and plan to send that this cycle.

[1]: https://github.com/Rust-for-Linux/pin-init/pull/89

Cheers,
Benno
