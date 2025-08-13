Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FA12EAB8C
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092097; cv=none; b=rSTAUcwkvf9y1y4erqd3S49t7UIcCGk78Am2/m1c+L/ObZRG5192Bd2j/+iU4jLK5CB84tmuaNCZr3r6MA+Cd3RYp/0wKIjosZDk/A1I151nCGiGsi7p0f01cJk3iBSfl2IViX5bcc7r0kw3pwCBx14VZXhZFCrjl8Q49AA76lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092097; c=relaxed/simple;
	bh=BdDPaDO58+HcI3SyJ9RMQhmJEXMMwfSExujznz5E6pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mE+IWbXGwsQhCXsyuiZEt6Id/bN+o7cxOho9ResMo0gOiE6+17vqPc/amN4InRwRfnMTfj95PFKG2cyaqegPyXwv34Wtsi3HtHPftAJ9S2UvxJMwgj7Fi4pSDYV1TFrGUxlQsphkTYkeyEfAkPnGNC8Lk3DvoCDDG3Tpj7KKbiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dugarreau.fr; spf=pass smtp.mailfrom=dugarreau.fr; dkim=pass (2048-bit key) header.d=dugarreau.fr header.i=@dugarreau.fr header.b=GTWD/Fqb; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=vnfS87G+; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dugarreau.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dugarreau.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dugarreau.fr header.i=@dugarreau.fr header.b="GTWD/Fqb";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="vnfS87G+"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=GTWD/FqbXRm40QmGpJXta4ggUauD33gEe0RSobivObwhe6KxKw2q2mH9NBVA4i8BCu683u7hMVWod2mn0ltj+hROA5rh97k9FqdrdI3+NCLHxlTQOPKdQhHB+tenBmZJ65rHDT7yj9NV9mFm2YZp6MMWMSUwKo03CrkgnI38gLeTGVqh+xSLfAm16vBkn1sfzQ4hzqlyIUeSO3YwpTB5tIYZNI8/53y+AUxZXU4ocsFzd8MQ6qlivhnDYwFJxAOF4166XSzPSpvq6Z/pC2ryACBSAtluw3Y7VvaGMMrObMlgzg7SZHpp8f6WdqFO5nS+ic5KD0i7Wh0CRUXIPQzSFw==; s=purelymail2; d=dugarreau.fr; v=1; bh=BdDPaDO58+HcI3SyJ9RMQhmJEXMMwfSExujznz5E6pg=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=vnfS87G+vao96NoMHR4kRk4OEbX4wjm1xWzVS8e7fZDXANnyTbOuxPxX3QFzq0csHvwbnmZ972zJ/3LcqPvWBHa5oYjO8tayxNU17yCHcxA3W8JB4FT+h4bxHCEYDAb3j7LGuG43ir2qBgXniAY1Qxpin101AIaPKP+Qpg2dJR7oYB2+qjjKLlF8GYBRYJDYWyNOGptoD1C/k+Y7QaZDDvJRKqFa57Vq8GTMYFq0KBE1mIJrtBm39AVbWDY7az9OQYzu1947qX0aqEPSPLXYU1y3OLoU+xpnMzJ+eNN58LNrvIgLPmoIVG8oX5t9eeju1Oj9/5h35kTg5+65+DoCJQ==; s=purelymail2; d=purelymail.com; v=1; bh=BdDPaDO58+HcI3SyJ9RMQhmJEXMMwfSExujznz5E6pg=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 78338:10797:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1094626353;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 13 Aug 2025 13:34:07 +0000 (UTC)
From: =?UTF-8?q?Beno=C3=AEt=20du=20Garreau?= <benoit@dugarreau.fr>
To: Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?q?Beno=C3=AEt=20du=20Garreau?= <benoit@dugarreau.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Benno Lossin <lossin@kernel.org>
Subject: Re: [PATCH v4 2/4] rust: iov: add iov_iter abstractions for ITER_DEST
Date: Wed, 13 Aug 2025 15:33:39 +0200
Message-ID: <20250813133343.7877-1-benoit@dugarreau.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813-iov-iter-v4-2-c4f1932b05ef@google.com>
References: 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail

On Wed, 13 Aug 2025 08:27:18 +0000 Alice Ryhl <aliceryhl@google.com> wrote:

> +    /// Utility for implementing `read_iter` given the full contents of =
the file.
> +    ///
> +    /// The full contents of the file being read from is represented by =
`contents`. This call will
> +    /// write the appropriate sub-slice of `contents` and update the fil=
e position in `ppos` so
> +    /// that the file will appear to contain `contents` even if takes mu=
ltiple reads to read the
> +    /// entire file.
> +    #[inline]
> +    pub fn simple_read_from_buffer(&mut self, ppos: &mut i64, contents: =
&[u8]) -> Result<usize> {
> +        if *ppos < 0 {
> +            return Err(EINVAL);
> +        }
> +        let Ok(pos) =3D usize::try_from(*ppos) else {
> +            return Ok(0);
> +        };
> +        if pos >=3D contents.len() {
> +            return Ok(0);
> +        }
> +
> +        // BOUNDS: We just checked that `pos < contents.len()` above.
> +        let num_written =3D self.copy_to_iter(&contents[pos..]);

This should use `contents.get(..pos)` instead of doing the bound check manu=
ally.

> +
> +        // OVERFLOW: `pos+num_written <=3D contents.len() <=3D isize::MA=
X <=3D i64::MAX`.
> +        *ppos =3D (pos + num_written) as i64;
> +
> +        Ok(num_written)
> +    }

Beno=C3=AEt du Garreau
