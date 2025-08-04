Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007451EA7E9;
	Mon,  4 Aug 2025 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754320296; cv=none; b=YTZg+vqdxSvhl5GoRTE/WZmEaQ8LrqILpUHhJiCoImu4nNGoP+dq/pAVOTNrcBGk3vtXE0brcWa+9eHIjwfLNNyk5yQ7mNqIuskHSQ8DRS2mWxbAWbBX5fHf6LLmd0PLW8D3HWw2d03cgt2Jp1XH86GFkqRrUu7MZCm7Qed/vq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754320296; c=relaxed/simple;
	bh=WsBZ9IWDi4AHnAaDyJYEnE0j2P2HYEAvJGAl8zo5e4U=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=j/SZwKjWhBNrUkZdVMNeoBqKlbHRvp9Ck8RmoDheBrzya3jyCyTFsNaOUM3sTH1VqDMyrPMNV8UTwZA/R2iu9tLwonpMTxOfsIvWWU+MQuBaVoA+YU3cBX5Yt3l8IQYSCD5ZFLcy/i14B08NIr97gDy9dq09lo6sM35l1r7yz0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xfepz9Z0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xfepz9Z0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA21C4CEE7;
	Mon,  4 Aug 2025 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754320295;
	bh=WsBZ9IWDi4AHnAaDyJYEnE0j2P2HYEAvJGAl8zo5e4U=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Xfepz9Z0LMoO19prxl1RC/Qhu/HzpwiQPHzWUOiHzdOPniAJPeu1Z2ZrSV3x5Hvxa
	 Dv+QpoXahJ9MpZuLE4JkLoYP3QEgQJCA0ys2/JxrNwZmFYg03ko/bAGL6I6HbwGXEn
	 S9rBu4eRISHBSAfOlLF+vOxSGN4T/L7HBDqqvtimCs/v7lNixsdjMIJTzvM0pCJTrL
	 3YsNKAyLF0QfAscolFq5rbsMtby16OYnhrQnOLV0jcuY0xowjan+bDoRiEkoVBu/qa
	 eY95FuuEnmUb9JLo+RIlJF6cUhkKxIi+9voLv9lMFoiGvw3v0mX74o/d3X12+UcERy
	 V4A8RWhbf8qmw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 17:11:30 +0200
Message-Id: <DBTQN3RW1H1S.1G8KB3ZD8A58F@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] rust: add `Alignment` type
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <20250804-num-v2-2-a96b9ca6eb02@nvidia.com>
 <CANiq72miQSuEEzKZsOhHKDah1kP+8PYcmODGqwtcaRwAggF-+g@mail.gmail.com>
In-Reply-To: <CANiq72miQSuEEzKZsOhHKDah1kP+8PYcmODGqwtcaRwAggF-+g@mail.gmail.com>

On Mon Aug 4, 2025 at 4:17 PM CEST, Miguel Ojeda wrote:
> On Mon, Aug 4, 2025 at 1:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>> +        if !self.0.is_power_of_two() {
>> +            // SAFETY: per the invariants, `self.0` is always a power o=
f two so this block will
>> +            // never be reached.
>> +            unsafe { core::hint::unreachable_unchecked() }
>> +        }
>
> I guess this one is here to help optimize users after they inline the
> cal? Is there a particular case you noticed? i.e. it may be worth
> mentioning it.

I suggested this in the previous version [1]. For example, it optimizes
division to only be a left shift.

[1]: https://lore.kernel.org/all/DBL1ZGZCSJF3.29HNS9BSN89C6@kernel.org

---
Cheers,
Benno
