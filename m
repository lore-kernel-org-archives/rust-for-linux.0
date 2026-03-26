Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCC2F290A;
	Thu, 26 Mar 2026 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540254; cv=none; b=bQvujyZioajx7qPQ7O/pTDEe2mo/8xJCDPriLOQE00El8lELwqCMnyv83/xxerBvjGXH/JDR7ua0CiXI07NfULzA3mby5whR6nE/HybMZClAHqiiFvTWjzsJrmCe4K1GuA80mjOKvO/eAPHTsv9Gt6Zh1S5tBdA9QS28BPL9QYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540254; c=relaxed/simple;
	bh=pKIj3tcfeBPXe/46yo2sX5wA8dnGZvT4oK8Fk/3CliM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7xRnQmoNDBesyNjz3dvDsKKvneInOLgYQU4qG705Svg9AJqwPKD/kIxNltInQEsR8VmUBkXeXTBFEkYzdVPfQlPkMGQkGSg8MeOlLsP6XQ8A5VcsBCtZRmVRew/O5RSNkcIkq2pZJPmPP4tyV9B8E2Hn0Aa+ogE+xsHld0s6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvSVhgA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvSVhgA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E743DC116C6;
	Thu, 26 Mar 2026 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774540254;
	bh=pKIj3tcfeBPXe/46yo2sX5wA8dnGZvT4oK8Fk/3CliM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qvSVhgA7jcT6VZ+RmHI1kRRK8SGsHoaWqmYWfUtk4Sjf70FbahN3PxYGCx97xwcsK
	 ApfJVYCeMAaSZubPTGkup/WMAajtik4a3BrnIptns/ZkuKk7ddFQKvfJo4O8DweEW3
	 8E1zlZBjAIxQhOQk4AxquNVO+MEo+SRTCkYVQrZgvpwypRvLjl/7s1Up6ynqeoAr6H
	 wNxJfmkqM6xjwmawlUMGur+HpNmDZ4Z9YcNJwSwI7N5KQviUTFAWm8CR2XQPCnteoH
	 Vd6KtCOfeK8nUtHwHGHn+ZVQdBMCOdGY5bRtplU0vTYJRDHDzZqCJqb74WEL6os0pG
	 7iJiclx0djgTw==
Message-ID: <fffb3c5b-e3ad-4784-8b74-da8e79218122@kernel.org>
Date: Thu, 26 Mar 2026 16:50:50 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [drm-rust-next PATCH 0/2] Fix sync::aref imports
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260326-drm-rust-next-fix-aref-v1-0-7f6f58d2828a@google.com>
 <CAH5fLggj1nFqQ6yxAgQxrTGJ11pzBdObbu7WNxv7YZDbhkCE2A@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAH5fLggj1nFqQ6yxAgQxrTGJ11pzBdObbu7WNxv7YZDbhkCE2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/26/26 4:49 PM, Alice Ryhl wrote:
> On Thu, Mar 26, 2026 at 4:25 PM Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> A few imports of types::ARef were merged into drm-rust-next, but this
>> old path is being removed in rust-next this cycle. Thus update them.
>>
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> ---
>> Alice Ryhl (2):
>>       rust: workqueue: use new sync::aref path for imports
>>       rust: drm: use new sync::aref path for imports
>>
>>  rust/kernel/drm/gem/mod.rs | 2 +-
>>  rust/kernel/workqueue.rs   | 8 +++++---
>>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> I'm applying this now to avoid a linux-next break tonight. Thanks for
> the reviews Danilo and Gary.

Sounds good, thanks.
