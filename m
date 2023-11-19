Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="wiv31T6A"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCC2115;
	Sun, 19 Nov 2023 08:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PqNhOHVUB0q9RpdnJQBOzBuTWvuux3ZuN7ljk9fyTT0=; b=wiv31T6A2ILuj9mkka+/EopnqN
	DogKvvni8xh2OnKytcwm08LvRVlRPh1u/5oCtBDj4f6U4HlX4M1vnkPjfzo9b9aWw7QGh5pDiIhM6
	kEKg32RbF4Pp845l/zcN2rjOWA5OzOnzTpKzt8gUwAi0WyoJWCcAC5jmOTa9W8n+Hcsw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r4kLN-000ZTH-Gn; Sun, 19 Nov 2023 17:08:21 +0100
Date: Sun, 19 Nov 2023 17:08:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, benno.lossin@proton.me,
	miguel.ojeda.sandonis@gmail.com, netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	wedsonaf@gmail.com
Subject: Re: [PATCH net-next v7 1/5] rust: core abstractions for network PHY
 drivers
Message-ID: <dc65b6f9-66ae-4a51-bbfc-bd7af90789ed@lunn.ch>
References: <20231026001050.1720612-2-fujita.tomonori@gmail.com>
 <20231117093906.2514808-1-aliceryhl@google.com>
 <20231119.225114.390963370394344723.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231119.225114.390963370394344723.fujita.tomonori@gmail.com>

> I don't intend to make them separate lines. If I make thme one line,
> it's too long (over 100) so I made them two lines.

Any networking prefers 80 anyway, so shorter is better.

    Andrew
