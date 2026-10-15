Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362F22F7EF4
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072637; cv=none; b=Oi1XJWSMUox5ST1tVXw+Ed3GCflxFqhGnkNuOHPrmRFf581lXOuveBXZ4xaTU7jtm+8UiQCSO8/4mQxe33Ng4R0LvHuB72LJaMzQArZZUD/SwcwxJTjHE3LQHpVX+9K5jMHv9uI4CCepvDoEApqHDONar42185RNfDJ93Ls+k7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072637; c=relaxed/simple;
	bh=7jNLKwOqbiWEPHrbrn0pf17cBjhNkg4KpFVZkY9bEs8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=TQUzbrbcCbvSLdxuyCTXR4WvweIj+qupWLl0WiloWPUrDqp66sWqS6K2wF6EI8IJf1phPKKvgW+gNfi9LR/zNaxhq7PQcJqetVrepLtcE3Ko0BzlJL97nzqXaETXQVJ5+1YWrzPtI3mkBKNacC0RSioWLv6/cVVSUAP2kq0z9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=DBUAR6WU; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=B1SMUW5b; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="DBUAR6WU";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="B1SMUW5b"
DKIM-Signature: a=rsa-sha256; b=DBUAR6WUtGCJIDLmDkTw/YNGCZfLM+o2BzaEHe81C7uetRQVqJm7PoNbpt2//lNqWz8Eer3Mh6fSDd+Yk6oFZiekuxTzZX+Z66QYv8OvFnEbJEJ5CBfVuHBuUx+nLHz2Ysqs2e3YkQRUFAejwOIRa8mD4dlLExHJUQdMd+ddIJCZ6ybkQOd73RJwjHdwPd/dQhxX315Zui+IE2Ec7K13NuC+D4mKv61fL1qeUgEzHUd/S8kAbP8qIkZnL+hQBunugEOEPpAak/LMWwk1pwRbE4lNbSpU0OTY1xpATlq5gAr/1DPwKswJoc2zfsSbOGLEUVek9LXV0ydG5eQnexutew==; s=purelymail3; d=rcpassos.me; v=1; bh=7jNLKwOqbiWEPHrbrn0pf17cBjhNkg4KpFVZkY9bEs8=; h=Received:Date:Subject:From:To;
DKIM-Signature: a=rsa-sha256; b=B1SMUW5bm8TJO1aMihwKHaPgNu4RxDeyhVlh1H1q84XLNyUzsp6UrQpo3in4EV5SFkwGnyOq6XvEUpLIeWcZBIK+lrtxterLxvNi2Kn6dWKDw0DlBN3IfTaTM3vO0is4D/HR8d4dPjxy6uFeccqH6ynoo4yy/02KzJq6GcP7TARXfa2tkwlYprk4O352GzG+0T3GfZFtxRMUX/Q5+EUX5gxy1lL0WIqSewXVmAYfV6sLRDtiwMjhK2Q+OIjtQiTroq/1NgiOH8/Xh2GgId4t4+9cx8PTYjxkvYliADE/+VvtvxVzMj/hYBwRXP6sHtePXO4qFveFzGWcdwe1GXtmyA==; s=purelymail3; d=purelymail.com; v=1; bh=7jNLKwOqbiWEPHrbrn0pf17cBjhNkg4KpFVZkY9bEs8=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -957297502;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 15 Oct 2026 13:56:30 +0000 (UTC)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 10:56:51 -0300
Message-Id: <DM5GQ0LS1ZRY.U1YDYGY80PEZ@rcpassos.me>
Subject: Re: [PATCH] rust_binder: avoid overflow in get_node_debug_info()
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 <syzbot+d39ca51f29c6b944a4f0@syzkaller.appspotmail.com>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>,
 "Rafael Passos" <rafael@rcpassos.me>
X-Mailer: aerc 0.22.0
References: <20261015-binder-debug-info-overflow-v1-1-81fffb74d288@google.com>
In-Reply-To: <20261015-binder-debug-info-overflow-v1-1-81fffb74d288@google.com>

I wish I had though of that when making the previous change.
A very elegant check, as returning "out"" with the default value is safe
:)

Reviewed-by: Rafael Passos <rafael@rcpassos.me>

Thanks (and sorry),
Rafael Passos
