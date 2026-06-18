Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7272C11C4
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784018; cv=pass; b=cvz1eWAKveJfXhoJM9bNZsVXryc07CcLi748+mB3d2MU+MowU9oiUWOc47MdzBd2zJbe76HU0Hzmk3iamn18MQmw5QbAeLRaf4ls0rdLdm+8FZQRRPT+VfFFHt76isAPBdeGTHBa0/GbAyZl4lrzEZjjWhxpnqp/4IjKw61OmQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784018; c=relaxed/simple;
	bh=81/aNoi63Unr0KciRRcWD9mwbhnyiv2BKpKkKoXYCi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cH7W5E18mB442Zqw2qNR/WsMW2dkE0lJTWhEYziU1heRZfKeg+wnzO1nTJu+BLV2k1P0mcCYJLpXAkd8ntqakhs7cy6QDhTvEDGHFDZhknkxUInAE6iPgAEff9RDLQfzPgC9tpwC/2KEuNRJ9+UTD/xwbQxM0QG9sKtsk13tx84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CXj4EsVW; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CXj4EsVW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-464192ab2e1so379496f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 05:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781784015; cv=none;
        d=google.com; s=arc-20240605;
        b=M+WEyJTs7ogEN8lbpF9hAKnCh1uqVW62q+HMKTXxSnJAtup52Q+c7yDsytnJAH2IEH
         yc1Jw5pYxweyk9Wt4gZFKBRUL1Im2oz5lF9SWSO4s2xdN3AJd5ix7nIJwMAay6VbQnM3
         FIBHRBMlf105F2MAjnwiB7NUX0wBoIEGj30EjpJgsKjOA3bQ/ijjl+WPTXuy37ewtzWf
         Kr/i42c1Iy4eZ8TyVGSpK3aKmXsKLHUXa97nOg0CiwB65wxdlmZaiCtZ4NqvXcgrEc51
         pkuC8u0XQTF7tUJ5CIG+L7xDglvFOjWkxOYuSVuspKyAAQ/vcl1xH7waElZRGISG9tKx
         UvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=81/aNoi63Unr0KciRRcWD9mwbhnyiv2BKpKkKoXYCi4=;
        fh=3LxbThgI1207eVt2r43g+nKlKpzY5nZv5WqZfkeRksY=;
        b=Db/8NUdCHpFM9KGZVmPpN7hut2q9z/5agqZf1xRYERJi1a8+Mc/oa1q+e0BjHPViuI
         txVQLiz8nkUZbhXHc+wVDlFuHfIEq6FY3ASmQz8MwHEaJ6Yzt85eTZns4oiGXWkTZG4H
         VoumFcCC5iUjarkns8/YVxZMz2WR87xv4hkuCMvBx3SPmHHTsNV0CvUfWmYZ1ILCnxTa
         JB/xkYjjUS8fpG/AUjnJEfX2qR0dg2I9AQe+qvmOnU017EvcjBPBcL1UIRBpK9HiiFrc
         iLGs41/nx3+vRcuIz9uD03oL1Rz3racrAo4mDeEk+65pBOKGIFy/fGD71bUOo9L5oynd
         /TAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781784015; x=1782388815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81/aNoi63Unr0KciRRcWD9mwbhnyiv2BKpKkKoXYCi4=;
        b=CXj4EsVW5Lj0uU0EJbHTBAuU3OVNbBjl3aelrrW/DeZdhik7/Nvh8ww2V1eiMH3RVL
         cqXQRWowT6CZ15VREU8g23utiQq5CcP15kSXtg5+uEaX8FcxvNy/O+xLVX0vVNkP0fm9
         YiRaszhUDqc5nHTGdZnY7sMsEP0Yok5kZ9qXHF12WSAKhIgNM3s9z9bYlEk+esmEDpiW
         pj6JyX4hjNQXdmsYcRzizo3cFYHXtUls9KrGzNNg4y2H1tiKbLV8HOIVnP/FRsMPv0sv
         66a6az1bIOK+2kQwWkQEXDABjBnk889jcfmZgzdFqeP1Xu/+X1fLJ7jSfBfwZWLvTRnk
         /zyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784015; x=1782388815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=81/aNoi63Unr0KciRRcWD9mwbhnyiv2BKpKkKoXYCi4=;
        b=IskvEblnYTLO2KA/8aGgUdpKSsXAZjf3v6WxIFhLq/q7GnOAm6mKrABtZ32o/L4WHq
         HznnQexztpVp1dvE/8q/RyFmbo/J/FesXsgdaH4YCdRNY6rroO+Mvsf8qjQo9IqRShVC
         b0BxbeCq3YV9YTLiYdsjngPIR1tbqujbqfq/9wmEd9R6xKk7Nd8xS447/Hk4FKQfXpEv
         zG4p1W7qM589CVDAg9lhvkIVYs2sz3h+dloOQ5t6lIPNgY5lsXyReE4pqepKxOOOZGYr
         gOkxvKY55GACB7zo9WeCjY2tJhZWl7I0ih2k0BtIeZxu1/zDsRS1lJnWx7A5pfKibJow
         2PiA==
X-Forwarded-Encrypted: i=1; AFNElJ93kB932PczVgChIkOTVzeuFI+KETv1j+nVTICCGo0y5O/ODSmG4STZqLqH1PHQKEB1uN4g448T03UOyFubQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6jWYbgGkBmMJ2JLrldDiiKqLFXpu3h/0so8C/ipmtwHIchJ3D
	nyoJFhwhZGms5bkaejLqMVrB/MOaknAIGRWhExZnwSuzTiQ8LU+lssNXqD603Jvk3PU0idI7Lwb
	kWCeeuLAZH9Aover38mgzIlubCoQmz53Ezw5xck3K
X-Gm-Gg: AfdE7clyPaTVA8oFmeauSmAMjnZIcqHUCmv6P59ucRsSbXLgSpaoFMnU6Kpfil6Cuej
	eTlW0rYw/4jqLDLqs8AhXIcnT8PQtW4EYPPgzKRm09kQcX1fr0hTs0jf7XOjSUndT4Kx0ym6tf8
	dlvez2+aZlmPtydZPFAb0nrKpyt3J96ib6KveYR0SheJjd/YatmCGTS8N2ACSCdytm4xbMo9LHM
	bUwVVkjJfQbcvXuMLsPFuRfC5PR561gJdmG0Po3PuWVuALucwgDgZ4x3w4VdGiB/rtGtomIOKiR
	6w0qjy879V1DF4YPR9sDmov+z1e+xcWIRuKVGgwklVYi5faVS4Q/ysWuoJE=
X-Received: by 2002:a5d:5e8b:0:b0:460:efd:c682 with SMTP id
 ffacd0b85a97d-463ace19026mr5485479f8f.24.1781784014317; Thu, 18 Jun 2026
 05:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618095952.3687099-1-phasta@kernel.org> <20260618095952.3687099-4-phasta@kernel.org>
In-Reply-To: <20260618095952.3687099-4-phasta@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Jun 2026 14:00:01 +0200
X-Gm-Features: AVVi8Cd9kHkmSQPgeBR6CxVVcsbl0p2YKmtPm8wUPVpL_M-iVZofLftfM_oENK8
Message-ID: <CAH5fLgj+-Y4XM3ev8cCfes0Qow5Ew=cmyqbPqog3t7OgDNPH1Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: sync: Use safe synchronize_rcu() abstraction in poll
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lyude Paul <lyude@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 12:01=E2=80=AFPM Philipp Stanner <phasta@kernel.org=
> wrote:
>
> We now have a safe wrapper for the foreign function synchronize_rcu().
>
> Use it in poll.rs.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
