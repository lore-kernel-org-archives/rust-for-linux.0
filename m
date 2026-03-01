Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4031AF1F;
	Sun,  1 Mar 2026 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772395665; cv=none; b=jLyIqflK4xVg6t1xZHIMfLiIKgBsS+ttwAQzvke3sLupqT4WWcISBmPEWRmJzgOdzx2tHJUzzVFixCkW/mZJHF0FzL+DNilsAyliMEuOyZJfSq6Asaq0/33hyFOKX0yBOimZ8kmV7Sltb/JQMA36qS9yvN++xGhFXqq/IkK2ndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772395665; c=relaxed/simple;
	bh=9BlOO871E4Gc5s7Wqm3SRo5o4KI314sQaaKQG/go4O8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jTvRA8dr5K5TfGzcX6yEO8nBjacNQOy/BTFKGhaHtavfVNT5aglPjZa2GWv68+s/OJbbqXC+GCxRp3PZHMQp8DJoiV/zEQqaQjKWWeW13qZpcWiAe7LfUMwjBmWqTpzlSOLikX4qWiweZLQxjVavN5A401wiv4LPZvqhleAoYtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQrsPZIT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQrsPZIT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFE0C2BC86;
	Sun,  1 Mar 2026 20:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772395665;
	bh=9BlOO871E4Gc5s7Wqm3SRo5o4KI314sQaaKQG/go4O8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=gQrsPZIThJPiwOdX2TbxXL2FBez/SuMqe4Mhpp+MeqOTF/NGAo/A0XEQqYKWPvJ4g
	 QOs2OssZIAbjvVxfwo6RyEPmiKqqEsHiK1kAe2465bcgdOQCE//CMBGNzB8UZ40Ukf
	 2AdFp7QllRS/0jeH91VAKJLSWXOh9N4jK+yTuSsBBJ8NfCg+t/t5FzAD2itFItgxBm
	 ULcCYJBGOs/5SFFO0rLass+TycDzsCDra7r7Zhco9PzXw5mDSh54Ocy55ysd2Q3pCh
	 zqmd+Y0JYPcLi//brofV7ESYrSx0UTfLF+AjqUF8dU/lMqFLlF393jBoI8JG1xtd4U
	 476vdEKAG7Kvg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 21:07:40 +0100
Message-Id: <DGRPTPS6L9PK.210LBKMZTKZQO@kernel.org>
Subject: Re: [PATCH v2 0/4] rust: Add ARef support for work items
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Tejun Heo" <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
In-Reply-To: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>

On Wed Feb 4, 2026 at 9:40 PM CET, Daniel Almeida wrote:
>       rust: workqueue: add support for ARef<T>
>       rust: drm: dispatch work items to the private data
>       rust: workqueue: add delayed work support for ARef<T>
>       rust: drm: dispatch delayed work items to the private data

With the imports fixed

Acked-by: Danilo Krummrich <dakr@kernel.org>

for the DRM bits.

However, we could avoid a (trivial) conflict taking it through the DRM tree=
. I
assume the Rust workqueue stuff is maintained by Alice and Tejun? (I couldn=
't
find a dedicated entry for rust/kernel/workqueue.rs.)

In any case, if you agree, I suggest to take it through the DRM tree.

Thanks,
Danilo
