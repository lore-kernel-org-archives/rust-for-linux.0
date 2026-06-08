Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12113B52F1
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908018; cv=pass; b=DKwPHvX4NiWbtM0fEtnE6fu7nJ5oP5nuM8KqkJlJ3Ecmk2MA0n72f950AuS9BoJ0RS/HDhfoV0ybebk52WPkqPmhwcuo4jeS8Gv5968huWp1kZKAYSlVgmlRO4dwElUJUKZHZEmZK6qHWzW2sVUFlpALJbDvOisTQ3jGgFtT8gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908018; c=relaxed/simple;
	bh=khmAR5+TmLiEiZ6IK4oCLkeUjN9Aim9Yvwa8QgkY2EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMbyvckiyOoSUHbCrDLbLkeWeBlxbdxOP8kdbRG00Nz5N+CtqJ0JJu9mcw1wmlYjXozJB2mtQWTVRTLbDPhvoezUcg9CcYP1Q4mtNhH2jDKxPip06sT6RrTDCK5E/7tYy04C0vKX6JPj0bkyhdQL55mQThuUZAxS0cHYf4vP5vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cd7NQxLK; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cd7NQxLK"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304dc707bfbso209915eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 01:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780908016; cv=none;
        d=google.com; s=arc-20240605;
        b=ET/k+SAhCbrCv6HNHvqvyz0R9469bP0JU7JvJwwGcc/qWL2zsYAMxUy3vR+Y9WFvKN
         ZzM8ab78fnSj+BFvnBTKfyTKY4FfMBSwvdkSRm8GtrLrjBrIATJzQQVRLi2zzNa7i7NC
         jz9Moce2F1gHQzLXohaM4aPSKivAnCst8oFfehUoA3Fekyvm8RrIe+Hi3tadSPqIX2qf
         qsaZRsgK+AhU7wX68+YxyEyUyKnLNJ6je0XRcDeDEnsDU0iFpnqCB3PTbvCWaiKB0aUm
         l8dbDHoHSwDws4B4CYP04OqG2iHeaxscYk5qQ2EOkibn/MmkFtjE8OioCrlJMLuPFLjD
         H3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=khmAR5+TmLiEiZ6IK4oCLkeUjN9Aim9Yvwa8QgkY2EE=;
        fh=iK5nkKl/SfNNfDmCpMZfbVfvNvcUPs7dNFrso841mW4=;
        b=ax0esTvyOZ6IGnebGubnIjOTVyUkK2f+ER8QfIS1A0B8lxkCdp58B+x9hjAFlO9Vn4
         HImYUAsba7klZUumt/IOWllpy8QHKTSMo9JkR4DYTZy/wq4MIooxqah4uGXldAVwXoDp
         +ErDgaKq67UcTPa3D7AJLJzoK1hFF3Szq5mMqtJE9wG16IVZmrS80yqxpb2h5dSgE0lU
         5OF5DuXgtaQMAlYkP/vaIF27O22BCMQ2ypn7VqN34mq5KWjDRy1okvqqp50lvpGfO95I
         ybpnwYKQdyTr9fGdrJxz8r+F7syDn7vAqXl6W2lYDDYBSIqnlQ8YOfHescVv7SF1krHs
         nWOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780908016; x=1781512816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khmAR5+TmLiEiZ6IK4oCLkeUjN9Aim9Yvwa8QgkY2EE=;
        b=Cd7NQxLKWLR/z14yvFUmARcTcOIhx9beOrHnwNiWTqnGhckpnuZLq1BBdm8lyR3cXz
         jKX5VAx4/VaYXfCIUPJDT51SHnnSel3bRIpy/S2I8LuVLIwnGjTj9OYT5VZw4zVE2djF
         epFjdnqn+pfS/w/iBGo6bFeCVK8j+u3OAemQQc6u0wjUu5wvz0UqG4lTEFZKyhIt3CWw
         50qTv1a0R6tkDyBYt8Ebll0DOcuWBPrAeaJl3Fh/DQspkB6lrRuqBuUk8rlTt+l6K9b2
         LbQAfHDFVtshOjA3oJy2jVW++ceUW3qODqLFVDmwIFB4yAH5zHPXdDnPWnTjt+sKyTjg
         Cq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908016; x=1781512816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=khmAR5+TmLiEiZ6IK4oCLkeUjN9Aim9Yvwa8QgkY2EE=;
        b=GT+PPOGHv/uhraMAWEJ+snR39cHCpl4k9CmpDW5GvYrq3wGUDNhE6UU+CDhcQ6ygwj
         QeeZZemL9pRCkHAhJwm97U7fjI6/UULSZ7RWuj4UCi3VZUcc6FuRUe2KohHkjT+7KqLr
         k0FkoCQnDoCyf6SX5rabYfNxQqxIstHKHhe1sQzAMd3odr2tzKRa30DHzskVcjR6QA/6
         lQ2by4Tr2XO2B/j4Tpc4u2KUE0u4XoiOauE5kAldv6ueV+DJUFYtti/lKEgLzqmeXeBW
         G8RlknAoNn9I1139Jb99Z+z6usFxRYb4DGvTn9GVfCt3awZVrbsV/H5HRMNs3SFRJ5Dd
         j34g==
X-Forwarded-Encrypted: i=1; AFNElJ9zIWaA+Y/g58+Ikq/7HTw7YZf4FbHIOvavh+PU03oM+CKx2e2OfYduzefEGvErJrnMzYlnysFScmd2MSis8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU8iiVWzlYjAtcnDGIw+d4c4SO3vBB9LE6ADlyRUWJazTRfqbm
	GrmumFHN37EV34xxiTd6XrtIfjmuI9T8BJ00wwbX2A2INBRJ7JtVe23e9hhhdgoF8T40k/vj8Se
	V+CZ67Jamq5BeqD+UdwL2/g0WwlRkD+A=
X-Gm-Gg: Acq92OH/mylXpi2s3NxkDyXnnHQfisRwGgw3GHHCACWJLBZ+6lZGT2Ijmk0U3rGHdah
	UMCw4OFtgepv9CQV7aga6mClibmaDzSFaBtdK4A/DsF9O7NzbSPDFotafcdbWnCMQ6NubBv1jna
	usXm4inJtbuSn1Bu7uCm35wKJMuwE9dsj+eq8Mqhmykq4sPzlALHVwC8Pr55+AKMTndKUs1PTEi
	JiVbe3bKGa5vCX+yuRpukSDu3Ai14Nh3aJ4lqldKVxIchePQSErb7AZbJVvkGretuxpfQQ1buRA
	PBH+MxgcEqaVsURPYAQvvXLLadZPWTqGrmT4c5CCyu0iT68oHlQxcWReiepeen3kj7jGuRPxIkG
	6OwcN978L5SETTRkARNMRaz0n0vijABdGWw==
X-Received: by 2002:a05:693c:3749:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-3077b21905fmr3702384eec.5.1780908016013; Mon, 08 Jun 2026
 01:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-export-do-unlocked-v2-1-e23001390231@kernel.org>
 <aiZvbCad0DeRu60g@google.com> <8733yxig6z.fsf@kernel.org>
In-Reply-To: <8733yxig6z.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 10:40:02 +0200
X-Gm-Features: AVVi8CedVNAJSNpQy4ozhFyj72DfkVOzSs6ENfgow_n6m3A4HbufugxN9JDQdvY
Message-ID: <CANiq72nrx9VtrkLkU3o2cH7Vt7bZYdCMyQ4X8TUM7tnj3+xa=g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: export lock::do_unlocked
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 10:34=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Is this part of our kunit harness?

Yeah, I had it there since the beginning, i.e. no worries about
backports or things like that, if that is what you mean.

Cheers,
Miguel
