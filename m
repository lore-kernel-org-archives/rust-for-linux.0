Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09C1A2392;
	Sun, 15 Mar 2026 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773572269; cv=none; b=ZkxXpE8yJyR41NVxqrcmJ5FiXuZs9IhkyfDpGqfQx4uT5sqX10KvxtZ+IOcdq//J0SLm5vzC/4FsLEWcA2/y0XiQVyocLJf7k44Tb9hmN7a9aILIvIjuiS+UKFrutiyf16T4m6MwZGxF8Y4TKLdKh/BGcOYiqRJNKP1Vk57F+JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773572269; c=relaxed/simple;
	bh=LrqYQiLjO0uH6Q+9KTt4HWKngBs6uq3SMP14pdVNkWk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=eHK+TFOa5pIihnVnYQCHQSBYFLvYQlWGi7ICSn6kZJdrokSZuuOSTr/GhzoE3+bQNuVdG/65KUgUQAaofEUrD/jc6GImxeNKBxukNnXmnvqLQI5S54TedSsz00MtJfcHFhrPgpqMZZQAZe5wvzl4Ts/bwtar5LnCufr12OM21ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV+aOySt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LV+aOySt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E243C4CEF7;
	Sun, 15 Mar 2026 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773572269;
	bh=LrqYQiLjO0uH6Q+9KTt4HWKngBs6uq3SMP14pdVNkWk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=LV+aOyStzYQLItXbyCbNHFkPykWiGnCwBtI5i4dzB/IN6STlX0g22gu3SJM4DxY3f
	 BatgzFfyK+xZkaU51nOnXdpiSnGV/NklbiqBDVbbYQjfkeprshl9uI78aJ4RJqHmLh
	 WsYCMUh9hVSHqaUQKNgwMV8lOgvIDKDRehSHPZE27NCaF7HFXb+KTXChcvLGTNRGm4
	 cLYPDaSBBfjsWlKiXXaYjTMNaPynQpgbZEtNEuf2dOupuOsLKCUke4cppoNZ1HfH19
	 vbovESAkAQLcOKYs3ppSRbtP5oN/8bERPRDdUOkD7d5fyXJygV8Y0PcazCXga/GWs5
	 XzCJzdQZm/SJQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 11:57:43 +0100
Message-Id: <DH3AW9U5DIQB.UIRWIA28IER8@kernel.org>
Subject: Re: [PATCH v9 08/10] rust: io: introduce `write_reg` and
 `LocatedRegister`
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
 <20260314-register-v9-8-86805b2f7e9d@nvidia.com>
 <DH2K2VEN94JH.3K1WTNSTYEUSU@garyguo.net>
 <DH33ISJP9GZF.29RJURXJDUY9C@nvidia.com>
In-Reply-To: <DH33ISJP9GZF.29RJURXJDUY9C@nvidia.com>

On Sun Mar 15, 2026 at 6:10 AM CET, Alexandre Courbot wrote:
> What is wrong with the example? It demonstrates how we can do a FIFO
> register with the current macro.

FIFO registers are not a go-to example for write_reg() and try_write_reg(),=
 as
the API will change. It is better to choose an example that remains valid.

> I was thinking that we can update this example once we have the right
> support, but in the meantime this looks useful to me.

That'd be fine to do somewhere else, but changing the example of write_reg(=
) and
try_write_reg() to

	io.write(FIFO_OUT, 10)

later on would not make much sense.
