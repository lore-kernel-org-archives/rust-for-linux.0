Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BA615B998
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782566366; cv=none; b=TGmRifSqU8BBEpeb1vAvxGL/uB/quajH5ezE2Qt7XL5fBmGah0VIgjXLK2pekV+NzZ0qJ8f3CUA2MN2Wbl8tMNd5kfAuGrHAcoW8LNvfrrdU7ihN/POVCqxPkynmdQf7QbjMQ5OYUyZ2Qlalxxgw+CgfUuhCZ5W0JAObrxETiEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782566366; c=relaxed/simple;
	bh=of29jqyHyB5qWxXSuuS59R998CMlMwheJGLVdsXX7Ik=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQtat5cwWSdgYiTtFdc2L6zIXmYKMKC5ccOz7lOzaZjEmoq7wm9W1LmTVpBvTb7Ia9Bv0GiZKWj+N+9JmSx354niqWkUOssBb/SdLps10wI+WTfaH1PQDwVWpFP0jptddN06iA1/yv6k6FW6ARXALWZWREDgfhsEKVyLGp+F88Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=185.70.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Sat, 27 Jun 2026 13:18:56 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Cote <danielstonecote@gmail.com>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 1/2] rust: kernel: create `overflow_assert!` macro
Message-ID: <38c93322-946d-4b7a-bd20-934c3c335f8c@antoniohickey.com>
In-Reply-To: <CANiq72mYBkEi2yAYjDa3vxNkROa7xp2bt88TFnbvHjPR59dXOg@mail.gmail.com>
References: <20250819003824.23019-1-contact@antoniohickey.com> <20250819003824.23019-2-contact@antoniohickey.com> <CANiq72mYBkEi2yAYjDa3vxNkROa7xp2bt88TFnbvHjPR59dXOg@mail.gmail.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: 5e7b631ea9ac83a5ca9dffe33afb7de73b3f4582
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Hi Antonio,
>
> Someone asked about this old issue in GitHub -- let me take the chance
> to give a couple comments to resurrect this series...

Hey Miguel,

I've been getting back up to speed on this patch series.

> On Tue, Aug 19, 2025 at 2:39=E2=80=AFAM Antonio Hickey
> <contact@antoniohickey.com> wrote:
>> Link: https://github.com/Rust-for-Linux/linux/issues/1159
> It seems you didn't reorder the tags as mentioned in v4? Was there a
> reason for that?

I don't see any valid reason other than just naively missing this on my=20
end, but I'll make sure my v6 reorders the tags as mentioned.

> +/// A guard before doing a size computation that could overflow:
> +/// ```
> +/// fn reserve_for_concat(curr: usize, to_add: usize, cap: usize) {
> +///     // If enabled, catch obvious overflow logic errors early:
> +///     overflow_assert!(curr <=3D cap, "curr=3D{} > cap=3D{}", curr, ca=
p);
> +///     overflow_assert!(to_add <=3D cap - curr, "would exceed cap: {}+{=
} > {}", curr, to_add, cap);
> +///     // ... then proceed to grow/append
> +/// }
> +/// ```

As I'm re-reviewing my patch for a v6, what are your thought's on this=20
example in the doc's of the macro?

My main worry is the placeholder comments make the example seem=20
incomplete, or are these kind of partial function examples normal?

Cheers,

Antonio Hickey


